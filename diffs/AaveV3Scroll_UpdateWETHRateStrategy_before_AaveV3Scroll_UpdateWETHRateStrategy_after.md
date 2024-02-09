## Reserve changes

### Reserves altered

#### WETH ([0x5300000000000000000000000000000000000004](https://scrollscan.com/address/0x5300000000000000000000000000000000000004))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x9205B37978aC983A297dFB53b3f3D2cCC7DDDADa](https://scrollscan.com/address/0x9205B37978aC983A297dFB53b3f3D2cCC7DDDADa) | [0xD828F2f9Da85b190721797bEaD5Eb0acC4150f05](https://scrollscan.com/address/0xD828F2f9Da85b190721797bEaD5Eb0acC4150f05) |
| variableRateSlope2 | 8 % | 80 % |
| stableRateSlope2 | 8 % | 80 % |
| interestRate | ![before](/.assets/7af3d32d5b53ea30044e549f0c9e403bbecdaaf1.svg) | ![after](/.assets/ca95ddfd1ad1b620d55be691c73b3c69ffb3f3f0.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x5300000000000000000000000000000000000004": {
      "interestRateStrategy": {
        "from": "0x9205B37978aC983A297dFB53b3f3D2cCC7DDDADa",
        "to": "0xD828F2f9Da85b190721797bEaD5Eb0acC4150f05"
      }
    }
  },
  "strategies": {
    "0xD828F2f9Da85b190721797bEaD5Eb0acC4150f05": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "53000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "33000000000000000000000000",
        "stableRateSlope2": "800000000000000000000000000",
        "variableRateSlope1": "33000000000000000000000000",
        "variableRateSlope2": "800000000000000000000000000"
      }
    }
  }
}
```