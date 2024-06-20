using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechicalTestAppBackend.Data;


namespace TechicalTestAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    // [Authorize]
    public class BPKBController : ControllerBase
    {
        private readonly MASTER_DBContext _context;

        public BPKBController(MASTER_DBContext context)
        {
            _context = context;
        }

        [HttpPost("insert")]
        public async Task<IActionResult> InsertBPKB([FromBody] BPKBFormDto bpkbForm)
        {
            var username = User.Identity?.Name;

            var bpkb = new TrBpkb
            {
                AgreementNumber = bpkbForm.AgreementNumber,
                BpkbNo = bpkbForm.BpkbNo,
                BranchId = bpkbForm.BranchId,
                BpkbDate = bpkbForm.BpkbDate?.ToLocalTime(),
                FakturNo = bpkbForm.FakturNo,
                FakturDate = bpkbForm.FakturDate?.ToLocalTime(),
                LocationId = bpkbForm.LocationId,
                PoliceNo = bpkbForm.PoliceNo,
                BpkbDateIn = bpkbForm.BpkbDateIn?.ToLocalTime(),
                CreatedBy = "ahmad",
                CreatedOn = DateTime.UtcNow.ToLocalTime(),
                LastUpdatedBy = username,
            };

            _context.TrBpkbs.Add(bpkb);

            await _context.SaveChangesAsync();

            return Ok(new { Message = "Data BPKB berhasil ditambahkan." });
        }

        [HttpGet("get location")]
        public async Task<IActionResult> GetLocation()
        {
            var res = await _context.MsLocationStorages.ToListAsync();

            return Ok(res);
        }
    }
}
