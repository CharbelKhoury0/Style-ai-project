import { Redirect } from 'expo-router';
import { ActivityIndicator, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { useAuth } from '@/contexts/AuthContext';
import { theme } from '@/constants/theme';

export default function HomeScreen() {
  const { loading, isAuthenticated, user, signOut } = useAuth();

  if (loading) {
    return (
      <View style={styles.centered}>
        <ActivityIndicator color={theme.semanticColors.primary} />
        <Text style={styles.loadingText}>Loading your session...</Text>
      </View>
    );
  }

  if (!isAuthenticated) {
    return <Redirect href="/login" />;
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Style AI</Text>
      <Text style={styles.subtitle}>Signed in as {user?.email}</Text>
      <Text style={styles.body}>
        Your production app shell is ready. Continue by adding your main wardrobe and styling flows here.
      </Text>
      <TouchableOpacity style={styles.button} onPress={signOut}>
        <Text style={styles.buttonText}>Sign Out</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  centered: {
    flex: 1,
    backgroundColor: theme.semanticColors.background,
    justifyContent: 'center',
    alignItems: 'center',
    padding: theme.spacing.lg,
  },
  loadingText: {
    marginTop: theme.spacing.md,
    color: theme.semanticColors.textSecondary,
    fontSize: theme.fontSize.base,
  },
  container: {
    flex: 1,
    backgroundColor: theme.semanticColors.background,
    justifyContent: 'center',
    padding: theme.spacing.lg,
  },
  title: {
    color: theme.semanticColors.primary,
    fontSize: theme.fontSize['3xl'],
    fontWeight: theme.fontWeight.bold,
    textAlign: 'center',
    marginBottom: theme.spacing.sm,
  },
  subtitle: {
    color: theme.semanticColors.textSecondary,
    fontSize: theme.fontSize.base,
    textAlign: 'center',
    marginBottom: theme.spacing.lg,
  },
  body: {
    color: theme.semanticColors.text,
    fontSize: theme.fontSize.base,
    textAlign: 'center',
    lineHeight: 24,
    marginBottom: theme.spacing.xl,
  },
  button: {
    backgroundColor: theme.semanticColors.primary,
    paddingVertical: theme.spacing.md,
    borderRadius: theme.borderRadius.md,
    alignItems: 'center',
  },
  buttonText: {
    color: theme.semanticColors.surface,
    fontSize: theme.fontSize.base,
    fontWeight: theme.fontWeight.semibold,
  },
});
