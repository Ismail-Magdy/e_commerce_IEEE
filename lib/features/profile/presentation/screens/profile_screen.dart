import 'package:e_commerce_app/features/profile/data/api/profile_api.dart';
import 'package:e_commerce_app/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: FutureBuilder<ProfileModel?>(
        future: ProfileApi().getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == .waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            );
          }
          ProfileModel? profile = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade400, Colors.blue.shade700],
                      begin: .topLeft,
                      end: .bottomRight,
                    ),
                    borderRadius: const .vertical(bottom: .circular(40)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: .circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            profile!.avatar ?? "https://picsum.photos/800",
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            profile.name ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: .bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            profile.role ?? "member",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const .all(24.0),
                  child: Column(
                    children: [
                      _buildSectionTitle("Account Settings"),
                      _buildProfileTile(
                        Icons.shopping_bag_outlined,
                        "My Orders",
                        "Track your orders",
                      ),
                      _buildProfileTile(
                        Icons.favorite_outline,
                        "Wishlist",
                        "Your favorite items",
                      ),
                      _buildProfileTile(
                        Icons.location_on_outlined,
                        "Shipping Address",
                        "Manage your addresses",
                      ),
                      _buildProfileTile(
                        Icons.payment_outlined,
                        "Payment Methods",
                        "Credit cards, wallets",
                      ),
                      const SizedBox(height: 24),
                      _buildSectionTitle("App Settings"),
                      _buildProfileTile(
                        Icons.notifications_none,
                        "Notifications",
                        "Control your alerts",
                      ),
                      _buildProfileTile(
                        Icons.lock_outline,
                        "Privacy",
                        "Manage your security",
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: .infinity,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.logout, color: Colors.red),
                          label: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: .bold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const .all(16),
                            backgroundColor: Colors.red.withValues(alpha: 0.05),
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: .centerLeft,
      child: Padding(
        padding: const .only(bottom: 16, left: 4),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: .bold),
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const .only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const .all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.05),
            borderRadius: .circular(10),
          ),
          child: Icon(icon, color: Colors.blue, size: 24),
        ),
        title: Text(title, style: const TextStyle(fontWeight: .bold)),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: () {},
      ),
    );
  }
}
