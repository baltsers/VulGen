static void mygroup_delete(mygroup_t *mg)
{
    node_t *n, *tn;
    LIST_FOREACH_SAFE(n, tn, mg->acs.head)
    {
        groupacs_t *ga = n->data;
        node_del(&ga->gnode, &mg->acs);
        node_del(&ga->unode, myuser_get_membership_list(ga->mu));
        object_unref(ga);
    }
    metadata_delete_all(mg);
}