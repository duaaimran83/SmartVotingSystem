using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

public class VoterContext : DbContext
{
    public VoterContext(DbContextOptions<VoterContext> options) : base(options) { }

    public DbSet<Voter> Voters { get; set; }
    public DbSet<Vote> Votes { get; set; }
}

public class Voter
{
    public int VoterID { get; set; }
    public string Name { get; set; }
    public DateTime DOB { get; set; }
    public string Address { get; set; }
    public string PhoneNumber { get; set; }
    public string Email { get; set; }
    public bool Registered { get; set; }
    public string VoterStatus { get; set; }
}

public class Vote
{
    public int VoteID { get; set; }
    public int VoterID { get; set; }
    public int ElectionID { get; set; }
    public int CandidateID { get; set; }
    public DateTime Timestamp { get; set; }
}
