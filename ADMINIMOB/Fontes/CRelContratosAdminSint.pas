//------------------------------------------------------------------------------
// ALTERAÇÕES :
//------------------------------------------------------------------------------
// Pendência  :
// Autor      : Daniel Simões
// Data       : 15/02/2006
// Descrição  : Adicionado no SubSelect da query "qryContratosAdminSint" o
//              somatório dos valores dos alugueis apenas dos imóveis com as
//              datas dentro da vigência...
//------------------------------------------------------------------------------

unit CRelContratosAdminSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect,
  fcCombo, fcColorCombo, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, uModuloImobiliario, DBCtrls, Provider, DBClient,
  uCMClientDataSet, Wwdatsrc;

type
  TcfgRelContratosAdminSint = class(TcfgRel)
    Label1: TLabel;
    rdgOrdena: TRadioGroup;
    edtAdminImovel: TEdit;
    btnBuscaAdm: TBitBtn;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    edtResponsavel: TEdit;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaResponsavel: TBitBtn;
    GroupBox1: TGroupBox;
    chkMesReajuste: TCheckBox;
    chkStatus: TCheckBox;
    cboStatus: TComboBox;
    chkFolha: TCheckBox;
    chkFim: TCheckBox;
    edtReajusteIni: TCMDateTimePicker;
    edtReajusteFim: TCMDateTimePicker;
    Label3: TLabel;
    edtEncerradoFim: TCMDateTimePicker;
    edtEncerradoIni: TCMDateTimePicker;
    Label4: TLabel;
    edtFolhaFim: TCMDateTimePicker;
    edtFolhaIni: TCMDateTimePicker;
    Label5: TLabel;
    dsTipoContrato: TwwDataSource;
    cdsTipoContrato: TCMClientDataSet;
    cdsTipoContratoIDTIPOCONTRIMOB: TFloatField;
    cdsTipoContratoSIGLA: TStringField;
    cdsTipoContratoNOME: TStringField;
    cdsTipoContratoDESCRICAO: TStringField;
    dspTipoContrato: TDataSetProvider;
    qryTipoContrato: TwwQuery;
    qryTipoContratoIDTIPOCONTRIMOB: TFloatField;
    qryTipoContratoSIGLA: TStringField;
    qryTipoContratoNOME: TStringField;
    qryTipoContratoDESCRICAO: TStringField;
    dblkTipoContrato: TDBLookupComboBox;
    lblTipoContrato: TLabel;

    procedure btnBuscaAdmClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure chkStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private { Private declarations }
    iAdminImovel  : integer;
    iResponsavel  : integer;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelContratosAdminSint: TcfgRelContratosAdminSint;



implementation
{$R *.DFM}
uses
   uSistema, dRelAdminImob, dLookImobiliario, uDiasInUteis, uFuncoesImob, dImobiliario,
  DMS;



procedure TcfgRelContratosAdminSint.MontaQuery;
var
   bMostraCobranca      : boolean;
begin
   with dtmRelAdminImob do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoContratosSint.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoContratosSint.Picture := nil;

      // preenche a label com o nome da Administradora
      if Assigned(rptContratosAdminSint_lblAdministradora) then
        if edtAdminImovel.Text <> '' then begin
           rptContratosAdminSint_lblAdministradora.Caption := edtAdminImovel.Text;
        end else begin
           rptContratosAdminSint_lblAdministradora.Caption := '< Todas >';
        end;

      // Responsável
      if Assigned(rptContratosAdminSint_lblResponsavel) then
        if edtResponsavel.Text <> '' then begin
           rptContratosAdminSint_lblResponsavel.Caption := edtResponsavel.Text;
        end else begin
           rptContratosAdminSint_lblResponsavel.Caption := '< Todos >';
        end;

      // Status do Contrato
      if Assigned(rptContratosAdminSint_lblStatus) then
        if chkStatus.Checked then begin
           rptContratosAdminSint_lblStatus.Caption := cboStatus.Text;
        end else begin
           rptContratosAdminSint_lblStatus.Caption := '< Todos >';
        end;

      // Mês de Reajuste
      if Assigned(rptContratosAdminSint_lblReajuste) then
        if chkMesReajuste.Checked then begin
           rptContratosAdminSint_lblReajuste.Caption := FormatDateTime('dd/mm/yyyy',edtReajusteIni.DateTime) +' a: '+FormatDateTime('dd/mm/yyyy',edtReajusteFim.DateTime);
        end else begin
           rptContratosAdminSint_lblReajuste.Caption := '< Todos >';
        end;

      // Mês de Fim
      if Assigned(rptContratosAdminSint_lblFim) then
        if chkFim.Checked then begin
           rptContratosAdminSint_lblFim.Caption   := 'Apenas Contratos com término de ' +  FormatDateTime('dd/mm/aaaa',edtEncerradoIni.DateTime) + 'a: ' + FormatDateTime('dd/mm/aaaa',edtEncerradoFim.DateTime);
           rptContratosAdminSint_lblFim.Visible   := True;
        end else begin
           rptContratosAdminSint_lblFim.Visible   := False;
        end;

      // Mês de Folha
      if Assigned(rptContratosAdminSint_lblFolha) then
        if chkFolha.Checked then begin
           rptContratosAdminSint_lblFolha.Caption := 'Apenas Contratos que geram Folha de ' + FormatDateTime('dd/mm/aaaa',edtFolhaIni.DateTime) + 'a: ' + FormatDateTime('dd/mm/aaaa',edtReajusteFim.DateTime); ;
           rptContratosAdminSint_lblFolha.Visible := True;
        end else begin
           rptContratosAdminSint_lblFolha.Visible := False;
        end;

      // Tipo de Contrato
      if Assigned(rptContratosAdminSint_lblTipoContrato) then
        if dblkTipoContrato.KeyValue <> NULL then
          rptContratosAdminSint_lblTipoContrato.Caption := cdsTipoContrato.FieldByName('SIGLA').AsString
        else
          rptContratosAdminSint_lblTipoContrato.Caption := '< Todos >';

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      with qryContratosAdminSint do begin

         Close;
         SQL.Text :=
         'SELECT ' + #13 +
         '   C.IDCONTRATOIMOVEL, ' + #13 +
         '   C.CONNUMERO AS NUMERO_CONTRATO, ' + #13 +
         '   C.CONNOME AS NOME_CONTRATO, ' + #13 +
         '   C.CONINDICEREAJUSTE, ' + #13 +
         '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN, ' + #13 +
         '   C.CONDATAINICIO, C.CONDATAFIM, ' + #13 +
         '   C.CONDIAVENCIMENTO AS VENCTO_ALUGUEL, ' + #13 +
         '   C.FLGTIPODIAVENC AS TIPO_DIA, ' + #13 +
         '   C.CONDIASTOLERANCIA, ' + #13 +
         '   SA.CIMVLRAJUSTADO AS VALOR_ALUGUEL, ' + #13 + // Daniel Simões - 15/02/2006 -
         '   C.CONDATARENEGOC AS DATA_REVISAO, ' + #13 +
         '   C.CONDATAREAJUSTE AS DATA_ULTIMO_REAJUSTE, ' + #13 +
         '   C.CONPROXREAJUSTE AS DATA_PROX_REAJUSTE, ' + #13 +
         '   C.CONDATADENUNCIA AS DATA_DENUNCIA, ' + #13 +
         '   C.CONDATAFIANCAFIM AS DATA_FIM_FIANCA, ' + #13 +
         '   C.CONDATAAVDENUNCIA, ' + #13 +
         '   C.CONDATAAVRENEGOC, ' + #13 +
         '   M.MOESIGLA AS INDICE_REAJUSTE, ' + #13 +
         '   SA.AREA_TOTAL, ' + #13 +
         '   (DECODE(SA.AREA_TOTAL, 0, 0, (C.CONVLRAJUSTADO / SA.AREA_TOTAL))) AS ALUGUEL_M2, ' + #13 +

         '   PL.RAZAOSOCIAL AS LOCATARIO_RS, ' + #13 +
         '   PL.NOME AS LOCATARIO_NF, ' + #13 +
         '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, ' + #13 +
         '   PA.NOME AS ADMINISTRADORA_NF, ' + #13 +
         '   PR.NOME AS RESPONSAVEL_NF, ' + #13 +

         '   EC.LOGRADOURO, EC.NUMERO, EC.COMPLEMENTO, ' + #13 +
         '   EC.BAIRRO, EC.CEP, ' + #13 +
         '   CID.NOME AS NOME_CIDADE, CID.UF, ' + #13 +
         '   PAIS.NOMEPAIS, ' + #13 +

         '   M.MSGDESCRICAO ' + #13 +

         'FROM ' + #13 +
         '   PESSOA PL, PESSOA PA, PESSOA PR,' + #13 +
         '   CONTRATOIMOVEL C, MOEDA M, ' + #13 +
         '   ENDPESS EC, CIDADES CID, PAIS, MSGBOLETO M, ' + #13 +
         '   TIPOCONTRIMOB TC, ' + #13 +

         '   ( ' + #13 +
         '   SELECT ' + #13 +
         '      CX.IDCONTRATOIMOVEL, ' + #13 +

         '      SUM(CX.CIMVLRAJUSTADO) AS CIMVLRAJUSTADO, ' +#13+ // Daniel Simões - 15/06/2006 -

         '      SUM(DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL, ' + #13 +
         '         DECODE(CX.CIMPERCENTRATEIO, 0, 0, ' + #13 +
         '            DECODE(I.IMOAREAGERENCIAL, NULL, 0, ' + #13 +
         '               I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100 ' + #13 +
         '            ) ' + #13 +
         '         ) ' + #13 +
         '      )) AS AREA_TOTAL ' + #13 +

         '   FROM ' + #13 +
         '      CONTRATOXIMOVEL CX, IMOVEL I ' + #13 +
         '   WHERE ' + #13 +
         '         ( CX.IDIMOVEL = I.IDIMOVEL ) ' + #13 +

// Daniel Simões - 15/02/2006 - ------------------------------------------------
         '     AND ( (CX.CIMDTFIM IS NOT NULL AND SYSDATE BETWEEN CX.CIMDTINI AND CX.CIMDTFIM ) OR ' +#13+
         '           (CX.CIMDTFIM IS NULL AND SYSDATE >= CX.CIMDTINI ) ) ' +#13+
// Daniel Simões - 15/02/2006 - ------------------------------------------------

         '   GROUP BY ' + #13 +
         '      CX.IDCONTRATOIMOVEL ' + #13 +
         '   ) SA ' + #13 +

         'WHERE ' + #13 +
         '   ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13;

         // filtro por Administradora
         if iAdminImovel > -1 then
         SQL.Text := SQL.Text +
         '   AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + #13;

         // filtro por Responsável
         if iResponsavel > -1 then
         SQL.Text := SQL.Text +
         '   AND ( C.IDRESPONSAVEL = ' + IntToStr(iResponsavel) + ' ) ' + #13;

         // filtro pelo status do Contrato
         if chkStatus.Checked then begin

            case cboStatus.ItemIndex of

               0: // (E)ncerrado
               SQL.Text := SQL.Text +
               '   AND ( C.CONDATAFIM <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) ' + #13;

               1: // (I)ndeterminado
               SQL.Text := SQL.Text +
               '   AND ( C.FLGINDETERMINADO = ''S'' ) ' + #13;

               2: // (R)escindido
               SQL.Text := SQL.Text +
               '   AND ( C.CONDATAFIM <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) ' + #13;

               3: // (V)igente
               SQL.Text := SQL.Text +
               '   AND ( ' + #13 +
               '   ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
               '   ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13;

               // Pendência - 22738 - Marcos ventura Topini
               4: // (S)uspenso
               SQL.Text := SQL.Text +
               '   AND ( ' + #13 +
               '   ( C.FLGSTATUS = ''S'' ) ) ' + #13;
               // Fim Pendência
            end;
         end;

         // filtro por mês de reajuste
         if chkMesReajuste.Checked then begin

            SQL.Text := SQL.Text +
            '   AND ( ' + #13 +
            '   ( C.CONDATAREAJUSTE BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtReajusteIni.DateTime) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtReajusteFim.DateTime) + ''', ''DD/MM/YYYY'') ) OR' + #13 +
            '   ( C.CONPROXREAJUSTE BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtReajusteIni.DateTime) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtReajusteFim.DateTime) + ''', ''DD/MM/YYYY'') ) ) ' + #13;

         end;

         // filtro por data de término
         if chkFim.Checked then begin

            SQL.Text := SQL.Text +
            '   AND ( C.CONDATAFIM BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtEncerradoIni.DateTime) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtEncerradoFim.DateTime) + ''', ''DD/MM/YYYY'') ) ' + #13;

         end;

         // filtro por contratos da Folha
         if chkFolha.Checked then begin

            SQL.Text := SQL.Text +
            '   AND ( (C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtFolhaIni.DateTime) + ''', ''DD/MM/YYYY'')) OR ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13 +
            '   AND ( C.CONDATACARENCIA < TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtFolhaFim.DateTime) + ''', ''DD/MM/YYYY'') ) ' + #13 +
            '   AND ( C.FLGTIPOCONTRATO = ''L'' ) ' + #13 +
            '   AND ( C.FLGCOBRANCAAUTO = 1 ) ';
         end;

         // filtro por Tipo de Contrato
         if dblkTipoContrato.KeyValue <> NULL then
           SQL.Text := SQL.Text +
             '   AND ( C.IDTIPOCONTRIMOB = ' + IntToStr(dblkTipoContrato.KeyValue) + ' ) ' + #13;

         SQL.Text := SQL.Text +
         '   AND ( C.IDLOCATARIO = PL.IDPESSOA ) ' + #13 +
         '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + #13 +
         '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) ) ' + #13 +
         '   AND ( C.IDCONTRATOIMOVEL = SA.IDCONTRATOIMOVEL ) ' + #13 +
         '   AND ( C.IDRESPONSAVEL = PR.IDPESSOA(+) ) ' + #13 +
         '   AND ( PL.IDENDCOBRANCA = EC.IDENDERECO(+) ) ' + #13 +
         '   AND ( PL.IDPESSOA = EC.IDPESSOA(+) ) ' + #13 +
         '   AND ( EC.IDCIDADES = CID.IDCIDADES(+) ) ' + #13 +
         '   AND ( EC.IDPAIS = PAIS.IDPAIS(+) ) ' + #13 +
         '   AND ( C.IDMSGBOLETO = M.IDMSGBOLETO(+) ) ' + #13 +
         '   AND ( C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) ) ' + #13 +

         'ORDER BY ' + #13;

         case rdgOrdena.ItemIndex of
            0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME ';
            1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO ';
         end;

         Open;
      end;
   end;
end;



procedure TcfgRelContratosAdminSint.btnBuscaAdmClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdm.SetFocus;
end;



procedure TcfgRelContratosAdminSint.BitBtn1Click(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelContratosAdminSint.btnBuscaResponsavelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Responsavel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Responsavel.RetornouValor then begin

      Screen.Cursor  := crHourGlass;

      iResponsavel         := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtResponsavel.Text  := dtmMS.MS_Responsavel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaResponsavel.SetFocus;
end;



procedure TcfgRelContratosAdminSint.btnLimpaResponsavelClick(Sender: TObject);
begin
   inherited;

   iResponsavel := -1;
   edtResponsavel.Clear;
end;



procedure TcfgRelContratosAdminSint.chkStatusClick(Sender: TObject);
begin
   inherited;

   if not(chkStatus.Checked) then cboStatus.ItemIndex := -1;
   cboStatus.Enabled := chkStatus.Checked;
end;



procedure TcfgRelContratosAdminSint.FormShow(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   iResponsavel := -1;

   cboStatus.ItemIndex     := 3;

end;



procedure TcfgRelContratosAdminSint.FormCreate(Sender: TObject);
begin
  inherited;
  if not cdsTipoContrato.Active then
    cdsTipoContrato.Open;
end;

procedure TcfgRelContratosAdminSint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsTipoContrato.Active then
    cdsTipoContrato.Close;
end;

end.
