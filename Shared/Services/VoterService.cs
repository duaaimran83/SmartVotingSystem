using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class VoterService
{
    private readonly VoterContext _context;

    public VoterService(VoterContext context)
    {
        _context = context;
    }

    public async Task<List<Voter>> GetVotersAsync()
    {
        return await _context.Voters.ToListAsync();
    }

    public async Task<bool> HasVotedAsync(int voterId)
    {
        return await _context.Votes.AnyAsync(v => v.VoterID == voterId);
    }
}

