using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using dealership.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace dealership.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DealershipController : ControllerBase
    {
        private readonly ILogger<DealershipController> _logger;

        public DealershipController(ILogger<DealershipController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public ReturnItem Get()
        {
            ReturnItem returnItem = new ReturnItem();
            try
            {
                return returnItem;
            }
            catch (Exception ex)
            {
                var exString = ex.ToString();
                _logger.LogError($"There was an error in the Dealership Controller: {exString}");
                return null;
            }
        }
    }
}
