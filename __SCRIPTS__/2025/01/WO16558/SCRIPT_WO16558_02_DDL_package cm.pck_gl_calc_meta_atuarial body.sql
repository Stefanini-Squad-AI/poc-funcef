create or replace package body cm.pck_gl_calc_meta_atuarial is

  procedure sp_altera_dados(poperacao           in number,
                            pcotdata            in date,
                            v_cota_nova_nsd     in number,
                            v_cota_nova_sd      in number,
                            v_cotmesref         in varchar2,
                            v_idusuarioinclusao in number) is
  
    pragma autonomous_transaction;
  
  begin
  
    if poperacao = 1 then
    
      insert into cotacaomoeda
        (moecodigo,
         cotdata,
         idusuarioinclusao,
         cotvalor,
         cotmesref,
         trgdtinclusao,
         cotdatafim,
         numdiasprazo,
         idcotacaomoeda,
         observacao)
      values
        (572,
         pcotdata,
         v_idusuarioinclusao,
         v_cota_nova_nsd,
         v_cotmesref,
         sysdate,
         last_day(pcotdata),
         extract(day from last_day(pcotdata)),
         cm.seqcotacaomoeda.nextval,
         'Inserção automática');
    
      insert into cotacaomoeda
        (moecodigo,
         cotdata,
         idusuarioinclusao,
         cotvalor,
         cotmesref,
         trgdtinclusao,
         cotdatafim,
         numdiasprazo,
         idcotacaomoeda,
         observacao)
      values
        (565,
         pcotdata,
         v_idusuarioinclusao,
         v_cota_nova_sd,
         v_cotmesref,
         sysdate,
         last_day(pcotdata),
         extract(day from last_day(pcotdata)),
         cm.seqcotacaomoeda.nextval,
         'Inserção automática');
    
    elsif poperacao = 2 then
    
      update cotacaomoeda
         set cotvalor = v_cota_nova_nsd
       where moecodigo = 572
         and cotdata = pcotdata;
    
      update cotacaomoeda
         set cotvalor = v_cota_nova_sd
       where moecodigo = 565
         and cotdata = pcotdata;
    
    elsif poperacao = 3 then
    
      delete cotacaomoeda
       where moecodigo = 565
         and cotdata = pcotdata;
    
      delete cotacaomoeda
       where moecodigo = 572
         and cotdata = pcotdata;
    
    end if;
    commit;
  end;

  procedure sp_calcula_indices(pcotdata      in date,
                               poperacao     in number, --1 inserir, 2 alterar, 3 excluir
                               v_outsucesso  out number,
                               v_outmensagem out varchar2) is
  
    v_juros_saldado     number;
    v_juros_nsaldado    number;
    v_inpc              number;
    v_cota_nsaldado     number;
    v_cota_saldado      number;
    v_cota_nova_sd      number;
    v_cota_nova_nsd     number;
    v_mesreferencia_ant varchar(7);
    v_mesreferencia     varchar(7);
    v_cotmesref         varchar(6);
    v_taxa_saldado      number;
    v_taxa_nsaldado     number;
    v_idusuarioinclusao number;
  
  begin
  
    v_outsucesso        := 1;
    v_outmensagem       := null;
    v_mesreferencia     := to_char(pcotdata, 'yyyy/mm');
    v_cotmesref         := to_char(pcotdata, 'mmyyyy');
    v_mesreferencia_ant := to_char(add_months(to_date(v_mesreferencia, 'yyyy/mm'), -1), 'yyyy/mm');
  
    begin
      select ((power((cotvalor / 100 + 1), (1 / 12)) * 100) - 100) / 100
        into v_juros_saldado
        from cotacaomoeda
       where moecodigo = 577
         and to_date(v_mesreferencia, 'yyyy/mm') between cotdata and
             cotdatafim;
    exception
      when no_data_found then
        v_outsucesso  := 0;
        v_outmensagem := 'Não foi encontrado cadastro de JUROS SD para o mês selecionado.';
        goto continue;
      when too_many_rows then
        v_outsucesso  := 0;
        v_outmensagem := 'Cadastro de JUROS SD para o mês selecionado está duplicado.';
        goto continue;
      when others then
        v_outsucesso  := 0;
        v_outmensagem := 'Favor verificar o cadastro de JUROS SD.';
        goto continue;
    end;
  
    begin
      select ((power((cotvalor / 100 + 1), (1 / 12)) * 100) - 100) / 100
        into v_juros_nsaldado
        from cotacaomoeda
       where moecodigo = 576
         and to_date(v_mesreferencia, 'yyyy/mm') between cotdata and
             cotdatafim;
    exception
      when no_data_found then
        v_outsucesso  := 0;
        v_outmensagem := 'Não foi encontrado cadastro de JUROS NSD para o mês selecionado.';
        goto continue;
      when too_many_rows then
        v_outsucesso  := 0;
        v_outmensagem := 'Cadastro de JUROS NSD para o mês selecionado está duplicado.';
        goto continue;
      when others then
        v_outsucesso  := 0;
        v_outmensagem := 'Favor verificar o cadastro de JUROS NSD.';
        goto continue;
    end;
  
    if poperacao <> 3 then
      begin
        select cotvalor / 100,
               idusuarioinclusao
          into v_inpc,
               v_idusuarioinclusao
          from cotacaomoeda
         where moecodigo = 7
           and to_date(v_mesreferencia, 'yyyy/mm') between cotdata and
               cotdatafim;
      exception
        when others then
          v_outsucesso  := 0;
          v_outmensagem := 'Favor verificar o cadastro de INPC.';
          goto continue;
      end;
    
      v_taxa_saldado  := (1 + v_juros_saldado) * (1 + v_inpc);
      v_taxa_nsaldado := (1 + v_juros_nsaldado) * (1 + v_inpc);
    
      begin
        select cotvalor
          into v_cota_nsaldado
          from cotacaomoeda
         where moecodigo = 572
           and to_date(v_mesreferencia_ant, 'yyyy/mm') between cotdata and
               cotdatafim;
      exception
        when no_data_found then
          v_outsucesso  := 0;
          v_outmensagem := 'Não foi encontrado cadastro de COTA EQ. N SALDADO para o mês ' ||
                           v_mesreferencia_ant || ' .';
          goto continue;
        when too_many_rows then
          v_outsucesso  := 0;
          v_outmensagem := 'Cadastro de COTA EQ. N SALDADO para o mês ' ||
                           v_mesreferencia_ant || ' está duplicado.';
          goto continue;
        when others then
          v_outsucesso  := 0;
          v_outmensagem := 'Favor verificar o cadastro de COTA EQ. N SALDADO.';
          goto continue;
      end;
    
      v_cota_nova_nsd := round((v_taxa_nsaldado * v_cota_nsaldado), 6);
    
      begin
        select cotvalor
          into v_cota_saldado
          from cotacaomoeda
         where moecodigo = 565
           and to_date(v_mesreferencia_ant, 'yyyy/mm') between cotdata and
               cotdatafim;
      exception
        when no_data_found then
          v_outsucesso  := 0;
          v_outmensagem := 'Não foi encontrado cadastro de COTA EQ1 SALDADO para o mês ' ||
                           v_mesreferencia_ant || ' .';
          goto continue;
        when too_many_rows then
          v_outsucesso  := 0;
          v_outmensagem := 'Cadastro de COTA EQ1 SALDADO para o mês ' ||
                           v_mesreferencia_ant || ' está duplicado.';
          goto continue;
        when others then
          v_outsucesso  := 0;
          v_outmensagem := 'Favor verificar o cadastro de COTA EQ1 SALDADO.';
          goto continue;
      end;
    
      v_cota_nova_sd := round((v_taxa_saldado * v_cota_saldado), 6);
    
    end if;
  
    if v_outmensagem is null then
      sp_altera_dados(poperacao, pcotdata, v_cota_nova_nsd, v_cota_nova_sd, v_cotmesref, v_idusuarioinclusao);
      v_outsucesso  := 1;
      v_outmensagem := 'Cadastro das cotas efetuado com sucesso!';
    end if;
  
    <<continue>>
    null;
  end;

end;
