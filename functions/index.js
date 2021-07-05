const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp();

exports.onFollowUser = functions.firestore.document('/followers/{userId}/userFollowers/{followerId}').onCreate(async (_, context) => {
    const userId = context.params.userId;
    const followerId = context.params.followerId;


    // Increment followed user's followers count
    const followedUserRef = admin.firestore().collection('users').doc(userId);
    const followedUserDoc = await followedUserRef.get();
    if (followedUserDoc.get('followers') !== undefined) {
        followedUserRef.update({ followers: followedUserDoc.get('followers') + 1, });
    }

    // Increment user's following count. 
});