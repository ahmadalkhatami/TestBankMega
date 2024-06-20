using System;
using System.Collections.Generic;

namespace TechicalTestAppBackend.Data
{
    public partial class MsUser
    {
        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public string Password { get; set; } = null!;
        public bool IsActive { get; set; }
    }
}
