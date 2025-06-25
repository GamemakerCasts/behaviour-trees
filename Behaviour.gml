function DecisionNode(_conditionFunc, _trueBranch, _falseBranch) constructor {
    condition = _conditionFunc;
    true_branch = _trueBranch;
    false_branch = _falseBranch;

    function evaluate() {
        if (condition()) {
            return true_branch.evaluate();
        } else {
            return false_branch.evaluate();
        }
    }
}

function ActionNode(_actionFunc) constructor {
    action = _actionFunc;

    function evaluate() {
        return action();
    }
}
