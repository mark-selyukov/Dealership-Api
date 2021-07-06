using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace dealership.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DealershipController : ControllerBase
    {

        private readonly ILogger<DealershipController> _logger;

        public DealershipController(ILogger<DealershipController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            return "Hello World";
        }
    }
}
