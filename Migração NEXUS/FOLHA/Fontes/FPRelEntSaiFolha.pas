unit FPRelEntSaiFolha;

// Alterações:
{ ------------------------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 22/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------------------------
Rotina    : MontaQueryEntrada
Data      : 11/08/2006 a 14/08/2006
Autor     : André Pontes
Pendencia : 22734
Descrição : 1) Correção do filtro em caso de seleção de benefício, de acordo com query enviada por
               Menezes (CBS)
            2) Otimização e reorganização das queries
--------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 11/08/2006
Autor     : André Pontes
Pendencia : 22734
Descrição : Otimização da abertura das queries, com retirada de texto desnecessariamente detalhado,
            além de redundante.
--------------------------------------------------------------------------------------------------
Rotina    : - (desenho do form)
Data      : 11/08/2006
Autor     : André Pontes
Pendencia : 22734
Descrição : Reorganização dos objetos no form (mudança apenas visual) + ajuste do tab_order
---------------------------------------------------------------------------------------------------}


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, CheckLst,
   Spin, fcCombo, fcColorCombo, usistema, dbasedados;

type
   TFrmPRelEntSaiFolha = class(TfrmOkCancelar)
       qryVersaoEntrada: TwwQuery;
       qryVersaoSaida: TwwQuery;
       RdoTipoOrdem: TRadioGroup;
       rdoEntSaiAmb: TRadioGroup;
       qryBeneficio: TwwQuery;
       dlgColor: TColorDialog;
       grbMesEnt: TGroupBox;
       lbVersaoEntrada: TLabel;
       cmbMesEnt: TComboBox;
       speAnoEnt: TSpinEdit;
       chklstVersaoEntrada: TCheckListBox;
       grbMesSai: TGroupBox;
       lbVersaoSaida: TLabel;
       cmbMesSai: TComboBox;
       speAnoSai: TSpinEdit;
       chklstVersaoSaida: TCheckListBox;
       rdoEscolheTabela: TRadioGroup;
    DBcboBeneficio: TwwDBLookupCombo;
       Label1: TLabel;
    lblCor: TLabel;
    ccbEscolheCor: TfcColorCombo;
    rdgTratamento: TRadioGroup;

       procedure bbtnConfirmarClick(Sender: TObject);
       procedure FormShow(Sender: TObject);
       procedure cmbMesEntChange(Sender: TObject);
       procedure speAnoEntChange(Sender: TObject);
       procedure cmbMesSaiChange(Sender: TObject);
       procedure speAnoSaiChange(Sender: TObject);
       procedure rdoEscolheTabelaClick(Sender: TObject);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgTratamentoClick(Sender: TObject);


   private  // Private declarations

      procedure MontaQueryEntrada;
      procedure MontaQuerySaida;


   public   // Public declarations

      ListaVersaoEnt,
      ListaVersaoSai : TStringList;

      sVersaoEntSel,
      sVersaoSaiSel  : String;

      bEscolheuVersaoEnt,
      bEscolheuVersaoSai   : Boolean;

      sAnoMesEntrada,
      sAnoMesSaida   : String;

   end;



var
  frmPRelEntSaiFolha: TfrmPRelEntSaiFolha;



implementation
{$R *.DFM}
uses
   dRelEntSaiFolha, uFuncoesFolha, fAguarde;




procedure TFrmPRelEntSaiFolha.bbtnConfirmarClick(Sender: TObject);
var
   I     : Integer;
   sSQL  : String;
begin
   inherited;

   dtmBaseDados.dbBaseDados.StartTransaction;
   if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
     Raise Exception.Create('Não foi possível gravar o log.')
   else
     dtmBaseDados.dbBaseDados.Commit;

   bEscolheuVersaoEnt := False;
   bEscolheuVersaoSai := False;

   //Impede que um dos meses estaja em branco ou nulo, o mesmo com os anos - Início
   if (cmbMesEnt.Text <> '') And ((speAnoEnt.Text <> '') Or (speAnoEnt.Value > 0))then
   begin
     if cmbMesEnt.ItemIndex > 8 then
       sAnoMesEntrada := speAnoEnt.Text+'/'+IntToStr(cmbMesEnt.ItemIndex+1)
     else
       sAnoMesEntrada := speAnoEnt.Text+'/0'+IntToStr(cmbMesEnt.ItemIndex+1);
   end
   else
   begin
     if Trim(cmbMesEnt.Text) = '' then
     begin
       ShowMessage('Por favor, escolha o mês base para comparação.');
       ModalResult := mrNone;
       Exit;
     end
     else
     begin
       if (Trim(speAnoEnt.Text) = '') Or (speAnoEnt.Value = 0) then
       begin
         ShowMessage('Por favor, escolha o ano base para comparação.');
         ModalResult := mrNone;
         Exit;
       end;
     end;
   end;

   if (cmbMesSai.Text <> '') And ((speAnoSai.Text <> '') Or (speAnoSai.Value > 0)) then
   begin
     if cmbMesSai.ItemIndex > 8 then
       sAnoMesSaida := speAnoSai.Text+'/'+IntToStr(cmbMesSai.ItemIndex+1)
     else
       sAnoMesSaida := speAnoSai.Text+'/0'+IntToStr(cmbMesSai.ItemIndex+1);
   end
   else
   begin
     if Trim(cmbMesSai.Text) = '' then
     begin
       ShowMessage('Por favor, escolha o mês de pagamento.');
       ModalResult := mrNone;
       Exit;
     end
     else
     begin
       if (Trim(speAnoSai.Text) = '') Or (speAnoSai.Value = 0) then
       begin
         ShowMessage('Por favor, escolha o ano de pagamento.');
         ModalResult := mrNone;
         Exit;
       end;
     end;
   end;

   //Testa se alguma versão foi selecionada
   For I:= 0 To chklstVersaoEntrada.Items.Count - 1 do
   begin
     if chklstVersaoEntrada.Checked[I] then
       bEscolheuVersaoEnt := True;
   end;

   For I:= 0 To chklstVersaoSaida.Items.Count - 1 do
   begin
     if chklstVersaoSaida.Checked[I] then
       bEscolheuVersaoSai := True;
   end;

   //Crítica dos meses
   if sAnoMesEntrada = sAnoMesSaida then
   begin
     ShowMessage('Por favor, escolha o mês base menor que o mês de pagamento.');
     ModalResult := mrNone;
     Exit;
   end
   else
   begin
     if speAnoEnt.Text > speAnoSai.Text then
     begin
       ShowMessage('O ano base não pode ser maior que o ano de pagamento.');
       ModalResult := mrNone;
       Exit;
     end
     else
     begin
       if ((cmbMesEnt.ItemIndex > cmbMesSai.ItemIndex) And (speAnoEnt.Text >= speAnoSai.Text)) then
       begin
         ShowMessage('O mês base não pode ser maior que o mês de pagamento.');
         ModalResult := mrNone;
         Exit;
       end;
     end;
   end;

   //Preenche os meses
   dtmRelEntSaiFolha.pplblMostraMesVersaoEnt.Caption := sAnoMesEntrada;
   dtmRelEntSaiFolha.pplblMostraMesVersaoSai.Caption := sAnoMesSaida;

   //Crítica das versões
   if (bEscolheuVersaoEnt = False) Or (bEscolheuVersaoSai = False) then
   begin
     ShowMessage('Por favor, escolha versão base e versão de pagamento.');
     ModalResult := mrNone;
     Exit;
   end
   else
   begin
     MontaFiltro(chklstVersaoEntrada, ListaVersaoEnt, sVersaoEntSel);
     MontaFiltro(chklstVersaoSaida, ListaVersaoSai, sVersaoSaiSel);
   end;

   //Guarda a Cor
   dtmRelEntSaiFolha.CorZebra := ccbEscolheCor.SelectedColor;

   // ----------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT '                                                                        + #13 +
   '   1000000 AS IDRESPONSAVEL, '                                                  + #13 +
   '   1000000 AS INSCRICAONUMERO, '                                                + #13 +
   '   1000000 AS BRUTO, '                                                          + #13 +
   '   1000000 AS LIQUIDO ,'                                                        + #13 +
   '   ''1111111111111'' AS MATRICULA, '                                            + #13 +
   '   ''123456789012345678901234567890123456789012345678901234567890'' AS NOME '   + #13 +
   'FROM '                                                                          + #13 +
   '   DUAL '                                                                       + #13 +
   'WHERE '                                                                         + #13 +
   '   1 = 2 ';

   dtmRelEntSaiFolha.qryEntrada.Close;
   dtmRelEntSaiFolha.qryEntrada.SQL.Clear;
   dtmRelEntSaiFolha.qryEntrada.SQL.Text := sSQL;
   dtmRelEntSaiFolha.qryEntrada.Open;

   dtmRelEntSaiFolha.qrySaida.Close;
   dtmRelEntSaiFolha.qrySaida.SQL.Clear;
   dtmRelEntSaiFolha.qrySaida.SQL.Text := sSQL;
   dtmRelEntSaiFolha.qrySaida.Open;

   // ----------------------------------------------------------------------------------------------
   case rdoEntSaiAmb.ItemIndex of

      0: MontaQueryEntrada;

      1: MontaQuerySaida;

      2:
      begin
         MontaQueryEntrada;
         MontaQuerySaida;
      end;

   end;
end;

procedure TFrmPRelEntSaiFolha.FormShow(Sender: TObject);
var
   wDia, wMes, wAno : Word;
begin
   inherited;

   ListaVersaoEnt := TStringList.Create;
   ListaVersaoSai := TStringList.Create;

   qryBeneficio.Open;

   DecodeDate(Date, wAno, wMes, wDia);

   cmbMesEnt.ItemIndex := wMes - 1;
   cmbMesSai.ItemIndex := wMes - 1;
   speAnoEnt.Value     := wAno;
   speAnoSai.Value     := wAno;
end;

procedure TFrmPRelEntSaiFolha.MontaQueryEntrada;
var
   sSQL  : String;
begin
   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +
   '   H1.IDRESPONSAVEL, E.MATRICULA, P.INSCRICAONUMERO, BENEF.NOME,  PP.NOME AS PLANO, '    + #13 +
   '   BC.DATAFINALPREVISTA, '                                                               + #13 +
   '   BC.DATAINICIO, BC.DATAFINAL, HB.IDBENEFICIO, B.NOME AS BENEFICIO, '                   + #13 +

   '   SUM(DECODE(PD.FLGESPECIAL, 0, DECODE(PD.FLGDESCONTO, 0, H1.VALORPROVENTO, 0), 0)) AS BRUTO, '                             + #13 +
   '   SUM(DECODE(PD.FLGESPECIAL, 0, DECODE(PD.FLGDESCONTO, 0, H1.VALORPROVENTO, 1, (-1) * H1.VALORPROVENTO ), 0)) AS LIQUIDO '  + #13 +

   'FROM '                                                                                   + #13 +
   '   ELEGPATRO        E,     '                                                             + #13 +
   '   PARTPREVPLAN     P,     '                                                             + #13 +
   '   PESSOA           BENEF, '                                                             + #13 +
   '   PROVDESC         PD,    '                                                             + #13 +
   '   HSTBENEFBFCIARIO HB,    '                                                             + #13 +
   '   BENEFBFCIARIO    BC,    '                                                             + #13 +
   '   BENEFICIO        B,     '                                                             + #13 +
   '   BENEFPLANPREV    BPP,   '                                                             + #13 +
   '   PLANPREV         PP,    '                                                             + #13;

   if rdoEscolheTabela.ItemIndex = 0 then sSQL := sSQL +
   '   PREVIA           H1     '                                                             + #13
   else sSQL := sSQL +
   '   HISTRUBSAL       H1     '                                                             + #13;

   sSQL := sSQL +
   ' WHERE '                                                                                 + #13 +
   '       H1.MESCOBRANCA     = ' + QuotedStr(sAnoMesSaida)                                  + #13 +
   '   AND HB.MESREFERENCIA   = ( '                                                          + #13 +
   '                            SELECT '                                                     + #13 +
   '                               MAX(HM.MESREFERENCIA) '                                   + #13 +
   '                            FROM '                                                       + #13 +
   '                               HSTBENEFBFCIARIO HM '                                     + #13 +
   '                            WHERE '                                                      + #13 +
   '                                   HM.IDTITULAR        = H1.IDTITULAR '                  + #13 +
   '                               AND HM.IDPESSOA         = H1.IDPESSOA '                   + #13 +
   '                               AND HM.IDPESSJUR        = H1.IDPATRO '                    + #13 +
   '                               AND HM.IDPLANOPREV      = H1.IDPLANOPREV '                + #13;

   if rdoEscolheTabela.ItemIndex = 0 then sSQL := sSQL +
   '                               AND HM.IDLOTE           = H1.IDLOTE '                     + #13
   else sSQL := sSQL +
   '                               AND HM.IDHSTFOLHABENEF  = H1.IDHSTFOLHABENEF '            + #13;

   sSQL := sSQL +
   '                               AND HM.IDBENEFICIO      = HB.IDBENEFICIO '                + #13 +
   '                               AND HM.MES              = H1.MESCOBRANCA '                + #13 +
   '                            ) '                                                          + #13;

   // ----------------------------------------------------------------------------------------------

   if trim(sVersaoSaiSel) <> '' then
   begin
      if rdoEscolheTabela.ItemIndex = 0 then sSQL := sSQL +
   '   AND H1.IDLOTE          IN (' + sVersaoSaiSel + ') '                                   + #13
      else sSQL := sSQL +
   '   AND H1.IDHSTFOLHABENEF IN (' + sVersaoSaiSel + ') '                                   + #13;
   end;

   // ----------------------------------------------------------------------------------------------

   if DBcboBeneficio.LookupValue <> '' then sSQL := sSQL +
   '   AND HB.IDBENEFICIO     = ' + DBcboBeneficio.LookupValue                               + #13;

   sSQL := sSQL +
   '   AND HB.MES             = H1.MESCOBRANCA '                                             + #13 +
   '   AND H1.IDTITULAR       = E.IDPESSOA '                                                 + #13 +
   '   AND H1.IDPATRO         = E.IDPESSJUR '                                                + #13 +
   '   AND H1.IDTITULAR       = P.IDPESSOA '                                                 + #13 +
   '   AND H1.IDPATRO         = P.IDPESSJUR '                                                + #13 +
   '   AND H1.IDPLANOPREV     = P.IDPLANOPREV '                                              + #13 +
   '   AND H1.IDPLANOPREV     = PP.IDPLANOPREV '                                             + #13 +
   '   AND H1.IDRESPONSAVEL   = BENEF.IDPESSOA '                                             + #13 +
   '   AND H1.IDRUBRICA       = PD.IDPROVENTO '                                              + #13 +
   '   AND H1.IDTITULAR       = HB.IDTITULAR '                                               + #13 +
   '   AND H1.IDPESSOA        = HB.IDPESSOA '                                                + #13 +
   '   AND H1.IDPATRO         = HB.IDPESSJUR '                                               + #13 +
   '   AND H1.IDPLANOPREV     = HB.IDPLANOPREV '                                             + #13;

   if rdoEscolheTabela.ItemIndex = 0 then sSQL := sSQL +
   '   AND H1.IDLOTE          = HB.IDLOTE '                                                  + #13
   else sSQL := sSQL +
   '   AND H1.IDHSTFOLHABENEF = HB.IDHSTFOLHABENEF '                                         + #13;

   sSQL := sSQL +
   '   AND B.TIPOBENEFICIO    < 99 '                                                         + #13 +
   '   AND HB.IDBENEFICIO     = B.IDBENEFICIO '                                              + #13 +
   '   AND HB.IDBENEFICIO     = BPP.IDBENEFICIO '                                            + #13 +
   '   AND HB.IDPLANOPREV     = BPP.IDPLANOPREV '                                            + #13 +
   '   AND HB.IDTITULAR       = BC.IDTITULAR '                                               + #13 +
   '   AND HB.IDPESSOA        = BC.IDPESSOA '                                                + #13 +
   '   AND HB.IDPESSJUR       = BC.IDPESSJUR '                                               + #13 +
   '   AND HB.IDPLANOPREV     = BC.IDPLANOPREV '                                             + #13 +
   '   AND HB.NUMEROPROCESSO  = BC.NUMEROPROCESSO '                                          + #13 +
   '   AND HB.SEQPROPOSTA     = BC.SEQPROPOSTA '                                             + #13 +
   '   AND HB.IDPLANOORIGEM   = BC.IDPLANOORIGEM '                                           + #13 +
   '   AND HB.IDBENEFICIO     = BC.IDBENEFICIO '                                             + #13;

   if (DBcboBeneficio.LookupValue <> '') or (rdgTratamento.ItemIndex = 1) then
   begin
     sSQL := sSQL +
   '   AND NOT EXISTS ( '                                                                    + #13 +
//   '                  SELECT IDRESPONSAVEL '                                                 + #13 +  //Everson TIBERO
   '                  SELECT H2.IDRESPONSAVEL '                                              + #13 +    //Everson TIBERO
   '                  FROM '                                                                 + #13 +
   '                     HISTRUBSAL       H2, '                                              + #13 +
   '                     HSTBENEFBFCIARIO HB1 '                                              + #13 +
   '                  WHERE '                                                                + #13 +
   '                         H2.IDTITULAR       = H1.IDTITULAR '                             + #13 +
   '                     AND H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL '                         + #13 +
   '                     AND H2.MESCOBRANCA     = ' + QuotedStr(sAnoMesEntrada)              + #13 +

   '                     AND H2.IDPESSOA        = HB1.IDPESSOA '                             + #13 +
   '                     AND H2.IDTITULAR       = HB1.IDTITULAR '                            + #13 +
   '                     AND H2.MESCOBRANCA     = HB1.MES '                                  + #13 +
   '                     AND H2.IDHSTFOLHABENEF = HB1.IDHSTFOLHABENEF '                      + #13 +
   '                     AND HB.IDPESSOA        = HB1.IDPESSOA '                             + #13 +
   '                     AND HB.IDBENEFICIO     = HB1.IDBENEFICIO '                          + #13;

      if trim(sVersaoSaiSel) <> '' then sSQL := sSQL +
   '                     AND H2.IDHSTFOLHABENEF IN (' + sVersaoEntSel + ') '                 + #13;

      sSQL := sSQL +
   '                  ) '                                                                    + #13;
   end
   else
   begin
     sSQL := sSQL +
   '   AND NOT EXISTS ( '                                                                    + #13 +
   '                  SELECT IDRESPONSAVEL '                                                 + #13 +
   '                  FROM '                                                                 + #13 +
   '                     HISTRUBSAL H2 '                                                     + #13 +
   '                  WHERE '                                                                + #13 +
   '                         H2.IDTITULAR       = H1.IDTITULAR '                             + #13 +
   '                     AND H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL '                         + #13 +
   '                     AND H2.MESCOBRANCA     = ' + QuotedStr(sAnoMesEntrada)              + #13;

      if trim(sVersaoSaiSel) <> '' then sSQL := sSQL +
   '                     AND H2.IDHSTFOLHABENEF IN (' + sVersaoEntSel + ') '                 + #13;

      sSQL := sSQL +
   '                  ) '                                                                    + #13;
   end;

   sSQL := sSQL +
   'GROUP BY '                                                                               + #13 +
   '   H1.IDRESPONSAVEL, E.MATRICULA,  P.INSCRICAONUMERO, BENEF.NOME, BC.DATAINICIO, '       + #13 +
   '   BC.DATAFINAL, BC.DATAFINALPREVISTA, HB.IDBENEFICIO, B.NOME, PP.NOME '                 + #13;

   case rdoTipoOrdem.ItemIndex of
      0: sSQL := sSQL + 'ORDER BY HB.IDBENEFICIO, E.MATRICULA ';
      1: sSQL := sSQL + 'ORDER BY HB.IDBENEFICIO, P.INSCRICAONUMERO ';
      2: sSQL := sSQL + 'ORDER BY HB.IDBENEFICIO, BENEF.NOME ';
   end;


   dtmRelEntSaiFolha.qryEntrada.Close;
   dtmRelEntSaiFolha.qryEntrada.SQL.Clear;
   dtmRelEntSaiFolha.qryEntrada.SQL.Text := sSQL;
   dtmRelEntSaiFolha.qryEntrada.SQL.SaveToFile(Sistema.TempDir + 'Folha-qryEntrada.txt');

   // ----------------------------------------------------------------------------------------------

   case rdoEntSaiAmb.ItemIndex of

      0:
      begin
         dtmRelEntSaiFolha.ppdbQuantSaida.Visible       := False;

         frmAguarde.Mostra('Aguarde... Montando Relatório.');
         frmAguarde.Repaint;
         dtmRelEntSaiFolha.qryEntrada.Open;

         if dtmRelEntSaiFolha.qryEntrada.IsEmpty then
         begin
            dtmRelEntSaiFolha.ppdbQuantEntrada.Visible       := False;
            dtmRelEntSaiFolha.pplblMostraZeroEntrada.Visible := True;
         end
         else
         begin
            dtmRelEntSaiFolha.ppdbQuantEntrada.Visible       := True;
            dtmRelEntSaiFolha.pplblMostraZeroEntrada.Visible := False;
         end;

         frmAguarde.Apaga;
      end;

      2:
      begin
         frmAguarde.Mostra('Aguarde... Montando Relatório.');
         frmAguarde.Repaint;
         dtmRelEntSaiFolha.qryEntrada.Open;

         if dtmRelEntSaiFolha.qryEntrada.IsEmpty then
         begin
            dtmRelEntSaiFolha.ppdbQuantEntrada.Visible       := False;
            dtmRelEntSaiFolha.pplblMostraZeroEntrada.Visible := True;
         end
         else
         begin
            dtmRelEntSaiFolha.ppdbQuantEntrada.Visible       := True;
            dtmRelEntSaiFolha.pplblMostraZeroEntrada.Visible := False;
         end;
      end;
   end;
   // ----------------------------------------------------------------------------------------------
end;

procedure TFrmPRelEntSaiFolha.MontaQuerySaida;
begin
  with dtmRelEntSaiFolha.qrySaida do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
    ' SELECT DISTINCT                                                       '+
    '   H1.IDRESPONSAVEL, E.MATRICULA, P.INSCRICAONUMERO, BENEF.NOME,       '+
    '   PP.NOME AS PLANO, '+
    '   BC.DATAFINALPREVISTA, '+
    '   BC.DATAINICIO, BC.DATAFINAL, HB.IDBENEFICIO, B.NOME AS BENEFICIO,   '+
    '   SUM(DECODE(PD.FLGESPECIAL,                                          '+
    '       0, DECODE(PD.FLGDESCONTO,                                       '+
    '         0, H1.VALORPROVENTO),0)) AS BRUTO,                            '+
    '   SUM(DECODE(PD.FLGESPECIAL,                                          '+
    '       0, DECODE(PD.FLGDESCONTO,                                       '+
    '          0, H1.VALORPROVENTO,                                         '+
    '            1, (-1)*H1.VALORPROVENTO),0)) AS LIQUIDO                   '+
    ' FROM                                                                  '+
    '   HISTRUBSAL H1, ELEGPATRO E, PARTPREVPLAN P, PESSOA BENEF,           '+
    '   PROVDESC PD, HSTBENEFBFCIARIO HB, BENEFBFCIARIO BC, BENEFICIO B,    '+
    '   BENEFPLANPREV BPP, PLANPREV PP                                      '+
    ' WHERE                                                                 '+
    '   H1.MESCOBRANCA     = '+QuotedStr(sAnoMesEntrada)+' AND              '+
    '   HB.MESREFERENCIA = (SELECT MAX(HM.MESREFERENCIA) '+
                           'FROM HSTBENEFBFCIARIO HM '+
                           'WHERE HM.IDTITULAR = H1.IDTITULAR '+
                           'AND HM.IDPESSOA = H1.IDPESSOA '+
                           'AND HM.IDPESSJUR = H1.IDPATRO '+
                           'AND HM.IDPLANOPREV = H1.IDPLANOPREV '+
                           'AND HM.IDHSTFOLHABENEF = H1.IDHSTFOLHABENEF '+
                           'AND HM.IDBENEFICIO = HB.IDBENEFICIO '+
                           'AND HM.MES         = H1.MESCOBRANCA) AND ');

    if Trim(sVersaoEntSel) <> '' then
    begin
      if pos(',', sVersaoEntSel) = 0 then
        SQL.Add('   H1.IDHSTFOLHABENEF = '+sVersaoEntSel+' AND                ')
      else
        SQL.Add('   H1.IDHSTFOLHABENEF IN ('+sVersaoEntSel+') AND             ');
    end;

    if Trim(DBcboBeneficio.Text) <> '' then
      SQL.Add('HB.IDBENEFICIO = '+DBcboBeneficio.LookupValue+' AND ');

    SQL.Add(
    '   HB.MES             = H1.MESCOBRANCA     AND                         '+
    '   HB.IDHSTFOLHABENEF = HB.IDHSTFOLHABENEF AND                         '+
    '   H1.IDTITULAR       = E.IDPESSOA         AND                         '+
    '   H1.IDPATRO         = E.IDPESSJUR        AND                         '+
    '   H1.IDTITULAR       = P.IDPESSOA         AND                         '+
    '   H1.IDPATRO         = P.IDPESSJUR        AND                         '+
    '   H1.IDPLANOPREV     = P.IDPLANOPREV      AND                         '+
    '   H1.IDPLANOPREV     = PP.IDPLANOPREV     AND                         '+
    '   H1.IDRESPONSAVEL   = BENEF.IDPESSOA     AND                         '+
    '   H1.IDRUBRICA       = PD.IDPROVENTO      AND                         '+
    '   H1.IDTITULAR       = HB.IDTITULAR       AND                         '+
    '   H1.IDPESSOA        = HB.IDPESSOA        AND                         '+
    '   H1.IDPATRO         = HB.IDPESSJUR       AND                         '+
    '   H1.IDPLANOPREV     = HB.IDPLANOPREV     AND                         '+
    '   H1.IDHSTFOLHABENEF = HB.IDHSTFOLHABENEF AND                         '+
    '   B.TIPOBENEFICIO    < 99                 AND                         '+
    '   HB.IDBENEFICIO     = B.IDBENEFICIO      AND                         '+
    '   HB.IDBENEFICIO     = BPP.IDBENEFICIO    AND                         '+
    '   HB.IDPLANOPREV     = BPP.IDPLANOPREV    AND                         '+
    '   HB.IDTITULAR       = BC.IDTITULAR       AND                         '+
    '   HB.IDPESSOA        = BC.IDPESSOA        AND                         '+
    '   HB.IDPESSJUR       = BC.IDPESSJUR       AND                         '+
    '   HB.IDPLANOPREV     = BC.IDPLANOPREV     AND                         '+
    '   HB.NUMEROPROCESSO  = BC.NUMEROPROCESSO  AND                         '+
    '   HB.SEQPROPOSTA     = BC.SEQPROPOSTA     AND                         '+
    '   HB.IDPLANOORIGEM   = BC.IDPLANOORIGEM   AND                         '+
    '   HB.IDBENEFICIO     = BC.IDBENEFICIO     AND                         '+
    '   not EXISTS (SELECT                                                  '+
    '                 IDRESPONSAVEL                                         ');

    if rdoEscolheTabela.ItemIndex = 0 then
    begin
      if Trim(sVersaoSaiSel) <> '' then
      begin
        SQL.Add(
        '               FROM                                                  '+
        '                 PREVIA P                                            '+
        '               WHERE                                                 '+
        '                 P.IDTITULAR       = H1.IDTITULAR AND                '+
        '                 P.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND            '+
        '                 P.MESCOBRANCA     = '+QuotedStr(sAnoMesSaida)       );

        if pos(',', sVersaoSaiSel) = 0 then
          SQL.Add(' AND P.IDLOTE = '+sVersaoSaiSel+')                        ')
        else
          SQL.Add(' AND P.IDLOTE IN ('+sVersaoSaiSel+'))                     ');
      end
      else
      begin
        SQL.Add(
        '               FROM                                                  '+
        '                 PREVIA P                                            '+
        '               WHERE                                                 '+
        '                 P.IDTITULAR       = H1.IDTITULAR AND                '+
        '                 P.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND            '+
        '                 P.MESCOBRANCA     = '+QuotedStr(sAnoMesSaida)+')' );
      end
    end
    else
    begin
      if Trim(sVersaoSaiSel) <> '' then
      begin
        SQL.Add(
        '               FROM                                                    '+
        '                 HISTRUBSAL H2                                         '+
        '               WHERE                                                   '+
        '                 H2.IDTITULAR       = H1.IDTITULAR AND                 '+
        '                 H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND             '+
        '                 H2.MESCOBRANCA     = '+QuotedStr(sAnoMesSaida)         );

        if pos(',', sVersaoSaiSel) = 0 then
          SQL.Add(' AND H2.IDHSTFOLHABENEF = '+sVersaoSaiSel+')               ')
        else
          SQL.Add(' AND H2.IDHSTFOLHABENEF IN ('+sVersaoSaiSel+'))            ');
      end
      else
      begin
        SQL.Add(
        '               FROM                                                    '+
        '                 HISTRUBSAL H2                                         '+
        '               WHERE                                                   '+
        '                 H2.IDTITULAR       = H1.IDTITULAR AND                 '+
        '                 H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND             '+
        '                 H2.MESCOBRANCA     = '+QuotedStr(sAnoMesSaida)+')'  );
      end;
    end;

    SQL.Add(
    ' GROUP BY                                                              '+
    '   H1.IDRESPONSAVEL, E.MATRICULA,  P.INSCRICAONUMERO, BENEF.NOME,      '+
    '   BC.DATAINICIO,    BC.DATAFINAL, '+
    '   BC.DATAFINALPREVISTA, '+
    '   HB.IDBENEFICIO,    B.NOME, '+
    ' PP.NOME ');

    case RdoTipoOrdem.ItemIndex of
      0: Sql.Add(' ORDER BY HB.IDBENEFICIO, E.MATRICULA');
      1: Sql.Add(' ORDER BY HB.IDBENEFICIO, P.INSCRICAONUMERO');
      2: Sql.Add(' ORDER BY HB.IDBENEFICIO, BENEF.NOME');
    end;
    case rdoEntSaiAmb.ItemIndex of
      1 :
      begin
        dtmRelEntSaiFolha.ppdbQuantEntrada.Visible       := False;

        frmAguarde.Mostra('Aguarde... Montando Relatório.');
        frmAguarde.Repaint;
        dtmRelEntSaiFolha.qrySaida.Open;

        if dtmRelEntSaiFolha.qrySaida.IsEmpty then
        begin
          dtmRelEntSaiFolha.ppdbQuantSaida.Visible       := False;
          dtmRelEntSaiFolha.pplblMostraZeroSaida.Visible := True;
        end
        else
        begin
          dtmRelEntSaiFolha.ppdbQuantSaida.Visible       := True;
          dtmRelEntSaiFolha.pplblMostraZeroSaida.Visible := False;
        end;

        frmAguarde.Apaga;
      end;

      2 :
      begin
        dtmRelEntSaiFolha.qrySaida.Open;

        if dtmRelEntSaiFolha.qrySaida.IsEmpty then
        begin
          dtmRelEntSaiFolha.ppdbQuantSaida.Visible       := False;
          dtmRelEntSaiFolha.pplblMostraZeroSaida.Visible := True;
        end
        else
        begin
          dtmRelEntSaiFolha.ppdbQuantSaida.Visible       := True;
          dtmRelEntSaiFolha.pplblMostraZeroSaida.Visible := False;
        end;

        frmAguarde.Apaga;
      end;
    end;
  end;
end;


procedure TFrmPRelEntSaiFolha.cmbMesEntChange(Sender: TObject);
var
  sMesEnt : String;

begin
  inherited;
  if (Trim(speAnoEnt.Text) = '') Or (speAnoEnt.Value = 0) then
    ShowMessage('Por favor, escolha o ano de entrada.')
  else
  begin
    if cmbMesEnt.ItemIndex > 8 then
      sMesEnt := speAnoEnt.Text+'/'+IntToStr(cmbMesEnt.ItemIndex+1)
    else
      sMesEnt := speAnoEnt.Text+'/0'+IntToStr(cmbMesEnt.ItemIndex+1);
    qryVersaoEntrada.Close;
    qryVersaoEntrada.ParamByName('PMESREF').AsString := sMesEnt;
    qryVersaoEntrada.Open;
    qryVersaoEntrada.First;
    chklstVersaoEntrada.Clear;
    ListaVersaoEnt.Clear;
    while not qryVersaoEntrada.EOF do
    begin
      chklstVersaoEntrada.Items.Add(qryVersaoEntrada.FieldByName('HISTORICO').AsString);
      chklstVersaoEntrada.ItemIndex := 0;
      ListaVersaoEnt.Add(qryVersaoEntrada.FieldByName('IDHSTFOLHABENEF').AsString);
      qryVersaoEntrada.Next;
    end;
  end;
end;

procedure TFrmPRelEntSaiFolha.speAnoEntChange(Sender: TObject);
var
  sMesEnt : String;

begin
  inherited;
  if Trim(cmbMesEnt.Text) = '' then
    ShowMessage('Por favor, escolha o mês de entrada.')
  else
  begin
    if cmbMesEnt.ItemIndex > 8 then
      sMesEnt := speAnoEnt.Text+'/'+IntToStr(cmbMesEnt.ItemIndex+1)
    else
      sMesEnt := speAnoEnt.Text+'/0'+IntToStr(cmbMesEnt.ItemIndex+1);
    qryVersaoEntrada.Close;
    qryVersaoEntrada.ParamByName('PMESREF').AsString := sMesEnt;
    qryVersaoEntrada.Open;
    chklstVersaoEntrada.Clear;
    ListaVersaoEnt.Clear;
    while not qryVersaoEntrada.EOF do
    begin
      chklstVersaoEntrada.Items.Add(qryVersaoEntrada.FieldByName('HISTORICO').AsString);
      chklstVersaoEntrada.ItemIndex := 0;
      ListaVersaoEnt.Add(qryVersaoEntrada.FieldByName('IDHSTFOLHABENEF').AsString);
      qryVersaoEntrada.Next;
    end;
  end;
end;

procedure TFrmPRelEntSaiFolha.cmbMesSaiChange(Sender: TObject);
var
  sMesSai : String;

begin
  inherited;
  if (Trim(speAnoSai.Text) = '') Or (speAnoSai.Value = 0) then
    ShowMessage('Por favor, escolha o ano de saída.')
  else
  begin
    if cmbMesSai.ItemIndex > 8 then
      sMesSai := speAnoSai.Text+'/'+IntToStr(cmbMesSai.ItemIndex+1)
    else
      sMesSai := speanosai.Text+'/0'+IntToStr(cmbMesSai.ItemIndex+1);

    if rdoEscolheTabela.ItemIndex = 0 then
    begin
      qryVersaoSaida.Close;
      qryVersaoSaida.SQL.Clear;
      qryVersaoSaida.SQL.Add(
      ' SELECT '+
        ' IDLOTE, '+
        ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

      ' FROM '+
        ' CTRLINTERFACE '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesSai)+
        ' AND FLGPREPARADO = 1 '+
        ' AND TIPO = ''B'' '+
        ' AND FLGVOLTATMP = 0 '+

      ' ORDER BY '+
        ' IDLOTE DESC ');
      qryVersaoSaida.Open;
      chklstVersaoSaida.Clear;
      ListaVersaoSai.Clear;
      while not qryVersaoSaida.EOF do
      begin
        chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('DESCRICAO').AsString);
        chklstVersaoSaida.ItemIndex := 0;
        ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDLOTE').AsString);
        qryVersaoSaida.Next;
      end;
    end
    else
    begin
      qryVersaoSaida.Close;
      qryVersaoSaida.SQL.Clear;
      qryVersaoSaida.SQL.Add(
      ' SELECT '+
        ' IDHSTFOLHABENEF, '+
        ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

      ' FROM '+
        ' HSTFOLHABENEF '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesSai)+
        ' AND FLGESTADO <> 2 '+

      ' ORDER BY '+
        ' IDHSTFOLHABENEF DESC ');
      qryVersaoSaida.Open;
      chklstVersaoSaida.Clear;
      ListaVersaoSai.Clear;
      while not qryVersaoSaida.EOF do
      begin
        chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('HISTORICO').AsString);
        chklstVersaoSaida.ItemIndex := 0;
        ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDHSTFOLHABENEF').AsString);
        qryVersaoSaida.Next;
      end;
    end;
  end;
end;

procedure TFrmPRelEntSaiFolha.speAnoSaiChange(Sender: TObject);
var
  sMesSai : String;

begin
  inherited;
  if Trim(cmbMesSai.Text) = '' then
    ShowMessage('Por favor, escolha o mês de saída.')
  else
  begin
    if cmbMesSai.ItemIndex > 8 then
      sMesSai := speAnoSai.Text+'/'+IntToStr(cmbMesSai.ItemIndex+1)
    else
      sMesSai := speanosai.Text+'/0'+IntToStr(cmbMesSai.ItemIndex+1);

    if rdoEscolheTabela.ItemIndex = 0 then
    begin
      qryVersaoSaida.Close;
      qryVersaoSaida.SQL.Clear;
      qryVersaoSaida.SQL.Add(
      ' SELECT '+
        ' IDLOTE, '+
        ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

      ' FROM '+
        ' CTRLINTERFACE '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesSai)+
        ' AND FLGPREPARADO = 1 '+
        ' AND TIPO = ''B'' '+
        ' AND FLGVOLTATMP = 0 '+

      ' ORDER BY '+
        ' IDLOTE DESC ');
      qryVersaoSaida.Open;
      chklstVersaoSaida.Clear;
      ListaVersaoSai.Clear;
      while not qryVersaoSaida.EOF do
      begin
        chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('DESCRICAO').AsString);
        chklstVersaoSaida.ItemIndex := 0;
        ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDLOTE').AsString);
        qryVersaoSaida.Next;
      end;
    end
    else
    begin
      qryVersaoSaida.Close;
      qryVersaoSaida.SQL.Clear;
      qryVersaoSaida.SQL.Add(
      ' SELECT '+
        ' IDHSTFOLHABENEF, '+
        ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

      ' FROM '+
        ' HSTFOLHABENEF '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesSai)+
        ' AND FLGESTADO <> 2 '+

      ' ORDER BY '+
        ' IDHSTFOLHABENEF DESC ');
      qryVersaoSaida.Open;
      chklstVersaoSaida.Clear;
      ListaVersaoSai.Clear;
      while not qryVersaoSaida.EOF do
      begin
        chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('HISTORICO').AsString);
        chklstVersaoSaida.ItemIndex := 0;
        ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDHSTFOLHABENEF').AsString);
        qryVersaoSaida.Next;
      end;
    end;
  end;
end;

procedure TFrmPRelEntSaiFolha.rdoEscolheTabelaClick(Sender: TObject);
var
  sMesSai : String;

begin
  inherited;
  if rdoEscolheTabela.ItemIndex = 0 then
  begin
    lbVersaoSaida.Caption := 'Lotes de Pagamento';
    if Trim(cmbMesSai.Text) = '' then
    begin
      ShowMessage('Por favor, escolha o mês de saída.');
      ModalResult := mrNone;
      Exit;
    end
    else
    begin
      if (Trim(speAnoSai.Text) = '') Or (speAnoSai.Value = 0) then
      begin
        ShowMessage('Por favor, escolha o ano de saída.');
        ModalResult := mrNone;
        Exit;
      end;
    end;
    if cmbMesSai.ItemIndex > 8 then
      sMesSai := speAnoSai.Text+'/'+IntToStr(cmbMesSai.ItemIndex+1)
    else
      sMesSai := speanosai.Text+'/0'+IntToStr(cmbMesSai.ItemIndex+1);

    qryVersaoSaida.Close;
    qryVersaoSaida.SQL.Clear;
    qryVersaoSaida.SQL.Add(
    ' SELECT '+
      ' IDLOTE, '+
      ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

    ' FROM '+
      ' CTRLINTERFACE '+

    ' WHERE '+
      ' MESREFERENCIA = '+QuotedStr(sMesSai)+
      ' AND FLGPREPARADO = 1 '+
      ' AND TIPO = ''B'' '+
      ' AND FLGVOLTATMP = 0 '+

    ' ORDER BY '+
      ' IDLOTE DESC ');
    qryVersaoSaida.Open;
    chklstVersaoSaida.Clear;
    ListaVersaoSai.Clear;
    while not qryVersaoSaida.EOF do
    begin
      chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('DESCRICAO').AsString);
      chklstVersaoSaida.ItemIndex := 0;
      ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDLOTE').AsString);
      qryVersaoSaida.Next;
    end;
  end
  else
  begin
    lbVersaoSaida.Caption := 'Versões de Pagamento';
    if Trim(cmbMesSai.Text) = '' then
    begin
      ShowMessage('Por favor, escolha o mês de saída.');
      ModalResult := mrNone;
      Exit;
    end
    else
    begin
      if (Trim(speAnoSai.Text) = '') Or (speAnoSai.Value = 0) then
      begin
        ShowMessage('Por favor, escolha o ano de saída.');
        ModalResult := mrNone;
        Exit;
      end;
    end;
    if cmbMesSai.ItemIndex > 8 then
      sMesSai := speAnoSai.Text+'/'+IntToStr(cmbMesSai.ItemIndex+1)
    else
      sMesSai := speanosai.Text+'/0'+IntToStr(cmbMesSai.ItemIndex+1);

    qryVersaoSaida.Close;
    qryVersaoSaida.SQL.Clear;
    qryVersaoSaida.SQL.Add(
    ' SELECT '+
      ' IDHSTFOLHABENEF, '+
      ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

    ' FROM '+
      ' HSTFOLHABENEF '+

    ' WHERE '+
      ' MESREFERENCIA = '+QuotedStr(sMesSai)+
      ' AND FLGESTADO <> 2 '+

    ' ORDER BY '+
      ' IDHSTFOLHABENEF DESC ');
    qryVersaoSaida.Open;
    chklstVersaoSaida.Clear;
    ListaVersaoSai.Clear;

    while not qryVersaoSaida.EOF do
    begin
      chklstVersaoSaida.Items.Add(qryVersaoSaida.FieldByName('HISTORICO').AsString);
      chklstVersaoSaida.ItemIndex := 0;
      ListaVersaoSai.Add(qryVersaoSaida.FieldByName('IDHSTFOLHABENEF').AsString);
      qryVersaoSaida.Next;
    end;
  end;
end;



procedure TFrmPRelEntSaiFolha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   ListaVersaoEnt.Free;
   ListaVersaoSai.Free;
end;



procedure TFrmPRelEntSaiFolha.rdgTratamentoClick(Sender: TObject);
begin
   inherited;

   if rdgTratamento.ItemIndex = 0 then
   begin
      DBcboBeneficio.LookupValue := '';
      DBcboBeneficio.Clear;
   end;

   DBcboBeneficio.Enabled := rdgTratamento.ItemIndex = 1;
end;



end.
