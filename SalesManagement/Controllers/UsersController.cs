#nullable disable
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SalesManagement.Data;
using SalesManagement.Models;

namespace SalesManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly SalesmanagementContext _context;

        public UsersController(SalesmanagementContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        /*[HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.UserId)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }*/

        // POST: api/Users
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _context.Users.Add(user);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (UserExists(user.UserId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetUser", new { id = user.UserId }, user);
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(int id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }

        private bool PhoneExists(string phone)
        {
            return _context.Users.Any(e => e.phone == phone);
        }

        private bool UserExistsWithUsername(string username)
        {
            return _context.Users.Any(e => e.username == username);
        }

        [HttpGet("UserStore")]
        public async Task<IEnumerable<UserStoreResult>> UserStoreResult(int? userId)
        {
            return await _context.GetProcedures().UserStoreAsync(userId);
        }

        [HttpPost("sign-in")]
        public async Task<IEnumerable<signInResult>> signInResult(string user_username, string user_password, bool? remember)
        {
            if (user_username == null || user_password == null)
            {
                return null;
            }
            else
            {
                return await _context.GetProcedures().signInAsync(user_username, user_password, true);
            }
        }

        [HttpPost("sign-up")]
        public async Task<ActionResult<User>> SignUp(User user)
        {
            try
            {
                var userExist = await _context.Users.ToListAsync();
                _context.Users.Add(user);
                foreach (var users in userExist)
                {
                    Console.WriteLine($"{users.username,10}");
                    if (users.username == user.username)
                    {
                        return BadRequest("Username have already exists!");
                    }
                }

                await _context.SaveChangesAsync();
            }

            catch (DbUpdateException)
            {
                if (UserExistsWithUsername(user.username))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }
            return CreatedAtAction("GetUser", new { id = user.UserId }, user);
        }

        [HttpPost("check-user")]
        public async Task<ActionResult<User>> checkUser(User user)
        {
            try
            {
                var userExist = await _context.Users.ToListAsync();
                foreach (var users in userExist)
                {
                    Console.WriteLine($"{users.username,10}");
                    if (users.username == user.username)
                    {
                        return Ok();
                    }
                }
            }

            catch (DbUpdateException)
            {
                return Conflict();
            }
            return BadRequest();
        }

        [HttpPut("{phone}")]
        public async Task<IActionResult> changePassword(string phone, User user)
        {
            if (phone != user.phone)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PhoneExists(phone))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
    }
}
