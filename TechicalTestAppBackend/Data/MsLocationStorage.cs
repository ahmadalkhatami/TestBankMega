using System;
using System.Collections.Generic;

namespace TechicalTestAppBackend.Data
{
    public partial class MsLocationStorage
    {
        public MsLocationStorage()
        {
            TrBpkbs = new HashSet<TrBpkb>();
        }

        public int LocationId { get; set; }
        public string LocationName { get; set; } = null!;

        public virtual ICollection<TrBpkb> TrBpkbs { get; set; }
    }
}
