create or replace package cm.pck_gl_calc_meta_atuarial is

  procedure sp_altera_dados(poperacao           in number,
                            pcotdata            in date,
                            v_cota_nova_nsd     in number,
                            v_cota_nova_sd      in number,
                            v_cotmesref         in varchar2,
                            v_idusuarioinclusao in number);

  procedure sp_calcula_indices(pcotdata      in date,
                               poperacao     in number,
                               v_outsucesso  out number,
                               v_outmensagem out varchar2);

end;
