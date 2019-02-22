// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

namespace Microsoft.Quantum.Canon {
    open Microsoft.Quantum.Primitive;

    /// # Summary
    /// Given two operations, applies one as conjugated with the other.
    ///
    /// # Description
    /// Given two operations, respectively described by unitary operators $U$
    /// and $V$, applies them in the sequence $U^{\dagger} V U$. That is,
    /// this operation implements the unitary operator given by $V$ conjugated
    /// with $U$.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    /// ## target
    /// The input to be provided to the outer and inner operations.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The target on which each of the inner and outer operations act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ApplyWithA
    /// - ApplyWithC
    /// - ApplyWithCA
    operation ApplyWith<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit), target : 'T) : Unit {
        outerOperation(target);
        innerOperation(target);
        Adjoint outerOperation(target);
    }

    /// # Deprecated
    /// Please use @"Microsoft.Quantum.Canon.ApplyWith".
    operation With<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit), target : 'T) : Unit {
        Renamed("Microsoft.Quantum.Canon.With", "Microsoft.Quantum.Canon.ApplyWith");
        ApplyWith(outerOperation, innerOperation, target);
    }

    /// # Summary
    /// Given outer and inner operations, returns a new operation that
    /// conjugates the inner operation by the outer operation.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    ///
    /// # Output
    /// A new operation whose action is represented by the unitary
    /// $U^{\dagger} V U$.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The type of the target on which each of the inner and outer operations
    /// act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ConjugatedByA
    /// - ConjugatedByC
    /// - ConjugatedByCA
    /// - ApplyWith
    function ConjugatedBy<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit)) : ('T => Unit) {
        return ApplyWith(outerOperation, innerOperation, _);
    }

    /// # Summary
    /// Given two operations, applies one as conjugated with the other.
    ///
    /// # Description
    /// Given two operations, respectively described by unitary operators $U$
    /// and $V$, applies them in the sequence $U^{\dagger} V U$. That is,
    /// this operation implements the unitary operator given by $V$ conjugated
    /// with $U$.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    /// ## target
    /// The input to be provided to the outer and inner operations.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The target on which each of the inner and outer operations act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ApplyWith
    /// - ApplyWithC
    /// - ApplyWithCA
    operation ApplyWithA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Adjoint), target : 'T) : Unit {
        body (...) {
            outerOperation(target);
            innerOperation(target);
            Adjoint outerOperation(target);
        }

        adjoint invert;
    }

    /// # Deprecated
    /// Please use @"Microsoft.Quantum.Canon.ApplyWithA".
    operation WithA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Adjoint), target : 'T) : Unit {
        body (...) {
            Renamed("Microsoft.Quantum.Canon.WithA", "Microsoft.Quantum.Canon.ApplyWithA");
            ApplyWithA(outerOperation, innerOperation, target);
        }
        adjoint auto;
    }

    /// # Summary
    /// Given outer and inner operations, returns a new operation that
    /// conjugates the inner operation by the outer operation.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    ///
    /// # Output
    /// A new operation whose action is represented by the unitary
    /// $U^{\dagger} V U$.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The type of the target on which each of the inner and outer operations
    /// act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ConjugatedByA
    /// - ConjugatedByC
    /// - ConjugatedByCA
    /// - ApplyWith
    function ConjugatedByA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Adjoint)) : ('T => Unit : Adjoint) {
        return ApplyWithA(outerOperation, innerOperation, _);
    }

    // # Summary
    /// Given two operations, applies one as conjugated with the other.
    ///
    /// # Description
    /// Given two operations, respectively described by unitary operators $U$
    /// and $V$, applies them in the sequence $U^{\dagger} V U$. That is,
    /// this operation implements the unitary operator given by $V$ conjugated
    /// with $U$.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    /// ## target
    /// The input to be provided to the outer and inner operations.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The target on which each of the inner and outer operations act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ApplyWith
    /// - ApplyWithA
    /// - ApplyWithCA
    operation ApplyWithC<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Controlled), target : 'T) : Unit {
        body (...) {
            outerOperation(target);
            innerOperation(target);
            Adjoint outerOperation(target);
        }

        controlled (controlRegister, ...) {
            outerOperation(target);
            Controlled innerOperation(controlRegister, target);
            Adjoint outerOperation(target);
        }
    }

    /// # Deprecated
    /// Please use @"Microsoft.Quantum.Canon.ApplyWithC".
    operation WithC<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Controlled), target : 'T) : Unit {
        body (...) {
            Renamed("Microsoft.Quantum.Canon.WithC", "Microsoft.Quantum.Canon.ApplyWithC");
            ApplyWithC(outerOperation, innerOperation, target);
        }
        controlled auto;
    }

    /// # Summary
    /// Given outer and inner operations, returns a new operation that
    /// conjugates the inner operation by the outer operation.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    ///
    /// # Output
    /// A new operation whose action is represented by the unitary
    /// $U^{\dagger} V U$.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The type of the target on which each of the inner and outer operations
    /// act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ConjugatedBy
    /// - ConjugatedByA
    /// - ConjugatedByCA
    /// - ApplyWith
    function ConjugatedByC<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Controlled)) : ('T => Unit : Controlled) {
        return ApplyWithC(outerOperation, innerOperation, _);
    }


    /// # Summary
    /// Given two operations, applies one as conjugated with the other.
    ///
    /// # Description
    /// Given two operations, respectively described by unitary operators $U$
    /// and $V$, applies them in the sequence $U^{\dagger} V U$. That is,
    /// this operation implements the unitary operator given by $V$ conjugated
    /// with $U$.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    /// ## target
    /// The input to be provided to the outer and inner operations.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The target on which each of the inner and outer operations act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ApplyWith
    /// - ApplyWithA
    /// - ApplyWithC
    operation ApplyWithCA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Adjoint, Controlled), target : 'T) : Unit {
        body (...) {
            outerOperation(target);
            innerOperation(target);
            Adjoint outerOperation(target);
        }

        adjoint auto;

        controlled (controlRegister, ...) {
            outerOperation(target);
            Controlled innerOperation(controlRegister, target);
            Adjoint outerOperation(target);
        }

        controlled adjoint auto;
    }

    /// # Deprecated
    /// Please use @"Microsoft.Quantum.Canon.ApplyWithCA".
    operation WithCA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Controlled, Adjoint), target : 'T) : Unit {
        body (...) {
            Renamed("Microsoft.Quantum.Canon.WithCA", "Microsoft.Quantum.Canon.ApplyWithCA");
            ApplyWithCA(outerOperation, innerOperation, target);
        }
        adjoint auto;
        controlled auto;
        controlled adjoint auto;
    }

    /// # Summary
    /// Given outer and inner operations, returns a new operation that
    /// conjugates the inner operation by the outer operation.
    ///
    /// # Input
    /// ## outerOperation
    /// The operation $U$ that should be used to conjugate $V$. Note that the
    /// outer operation $U$ needs to be adjointable, but does not
    /// need to be controllable.
    /// ## innerOperation
    /// The operation $V$ being conjugated.
    ///
    /// # Output
    /// A new operation whose action is represented by the unitary
    /// $U^{\dagger} V U$.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The type of the target on which each of the inner and outer operations
    /// act.
    ///
    /// # Remarks
    /// The outer operation is always assumed to be adjointable, but does not
    /// need to be controllable in order for the combined operation to be
    /// controllable.
    ///
    /// # See Also
    /// - ConjugatedByA
    /// - ConjugatedByC
    /// - ConjugatedByCA
    /// - ApplyWith
    function ConjugatedByCA<'T>(outerOperation : ('T => Unit : Adjoint), innerOperation : ('T => Unit : Controlled, Adjoint)) : ('T => Unit : Controlled, Adjoint) {
        return ApplyWithCA(outerOperation, innerOperation, _);
    }

}


