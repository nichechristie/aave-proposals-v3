// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, ScrollScript} from 'aave-helpers/ScriptUtils.sol';
import {WadRayMath} from 'aave-v3-core/contracts/protocol/libraries/math/WadRayMath.sol';
import {AaveV3Scroll} from 'aave-address-book/AaveV3Scroll.sol';
import {IV3RateStrategyFactory} from 'aave-helpers/v3-config-engine/V3RateStrategyFactory.sol';
import {AaveV3Scroll_AaveV3ScrollActivation_20240122} from './AaveV3Scroll_AaveV3ScrollActivation_20240122.sol';

/**
 * @dev Deploy Ethereum
 * command: make deploy-ledger contract=src/20240122_AaveV3Scroll_AaveV3ScrollActivation/DeployWETHRateStrategy.s.sol:DeployWETHRateStrategy chain=scroll
 */
contract DeployWETHRateStrategy is Script {
  function run() external {
    vm.startBroadcast();
    deploy();
    vm.stopBroadcast();
  }

  function deploy() public returns (address) {
    IV3RateStrategyFactory.RateStrategyParams[]
      memory rateParams = new IV3RateStrategyFactory.RateStrategyParams[](1);
    rateParams[0] = IV3RateStrategyFactory.RateStrategyParams({
      optimalUsageRatio: _bpsToRay(80_00),
      baseVariableBorrowRate: _bpsToRay(0),
      variableRateSlope1: _bpsToRay(3_30),
      variableRateSlope2: _bpsToRay(80_00),
      stableRateSlope1: _bpsToRay(3_30),
      stableRateSlope2: _bpsToRay(80_00),
      baseStableRateOffset: _bpsToRay(2_00),
      stableRateExcessOffset: _bpsToRay(8_00),
      optimalStableToTotalDebtRatio: _bpsToRay(20_00)
    });
    address[] memory interestRateStrategies = IV3RateStrategyFactory(AaveV3Scroll.RATES_FACTORY)
      .createStrategies(rateParams);
    return interestRateStrategies[0];
  }

  function _bpsToRay(uint256 amount) internal pure returns (uint256) {
    return (amount * WadRayMath.RAY) / 10_000;
  }
}
