// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Scroll, IPoolConfigurator} from 'aave-address-book/AaveV3Scroll.sol';
import {IProposalGenericExecutor} from 'aave-helpers/interfaces/IProposalGenericExecutor.sol';

contract AaveV3Scroll_UpdateWETHRateStrategy is IProposalGenericExecutor {
  address public constant WETH = 0x5300000000000000000000000000000000000004;
  address public immutable WETH_RATE_STRATEGY_ADDRESS;

  constructor(address wETHRateStrategyAddress) {
    WETH_RATE_STRATEGY_ADDRESS = wETHRateStrategyAddress;
  }

  function execute() external {
    AaveV3Scroll.POOL_CONFIGURATOR.setReserveInterestRateStrategyAddress(
      WETH,
      WETH_RATE_STRATEGY_ADDRESS
    );
  }
}
