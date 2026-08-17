unit CRelContratosMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Wwdatsrc,
  MontaSelect, Mask, DBCtrls, DBCtrls2, fcCombo, fcColorCombo, wwdbedit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario,
  DBClient, uCMClientDataSet, uCmSqlParams, Provider;

type
  TcfgRelContratosMestre = class(TcfgRel)
    Label1: TLabel;
    Label5: TLabel;
    btnBuscaAdminImovel: TBitBtn;
    edtAdminImovel: TEdit;
    rdgOrdena: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    btnLimpaAdminImovel: TBitBtn;
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
    btnBuscaImovelMestre: TBitBtn;
    edtImovelMestre: TEdit;
    btnLimpaImovelMestre: TBitBtn;
    edtReajusteIni: TCMDateTimePicker;
    Label3: TLabel;
    edtReajusteFim: TCMDateTimePicker;
    edtEncerradoFim: TCMDateTimePicker;
    Label4: TLabel;
    edtEncerradoIni: TCMDateTimePicker;
    edtFolhaIni: TCMDateTimePicker;
    Label6: TLabel;
    edtFolhaFim: TCMDateTimePicker;
    lblTipoContrato: TLabel;
    cdsTipoContrato: TCMClientDataSet;
    dspTipoContrato: TDataSetProvider;
    qryTipoContrato: TwwQuery;
    qryTipoContratoIDTIPOCONTRIMOB: TFloatField;
    qryTipoContratoSIGLA: TStringField;
    qryTipoContratoNOME: TStringField;
    qryTipoContratoDESCRICAO: TStringField;
    cdsTipoContratoIDTIPOCONTRIMOB: TFloatField;
    cdsTipoContratoSIGLA: TStringField;
    cdsTipoContratoNOME: TStringField;
    cdsTipoContratoDESCRICAO: TStringField;
    dblkTipoContrato: TDBLookupComboBox;
    dsTipoContrato: TwwDataSource;

    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure chkStatusClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
    iAdminImovel  : integer;
    iResponsavel  : integer;
    iImovelMestre : integer;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelContratosMestre: TcfgRelContratosMestre;



implementation
{$R *.DFM}
uses
   uMensErro, uSistema, dRelAdminImob, dLookImobiliario, uDiasInUteis, uFuncoesImob, dImobiliario,
  DMS;



procedure TcfgRelContratosMestre.MontaQuery;
var
   bMostraCobranca      : boolean;
begin
   with dtmRelAdminImob do begin

      // Os "if Assigned()" a seguir testa se os objetos existem porque o usuário
      // pode ter alterado o mesmo.

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if Assigned(dtmRelAdminImob.ppLogoLstContratosIM) then
        if ModuloImobiliario.AdminImob.bFlgLogoRelat then
           dtmRelAdminImob.ppLogoLstContratosIM.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
        else
           dtmRelAdminImob.ppLogoLstContratosIM.Picture := nil;

      // preenche a label com o nome da Administradora
      if Assigned(rptContratosMestre_lblAdministradora)then
        if length(trim(edtAdminImovel.Text)) > 0 then begin
           rptContratosMestre_lblAdministradora.Caption := edtAdminImovel.Text;
        end else begin
           rptContratosMestre_lblAdministradora.Caption := '< Todas >';
        end;

      // Responsável
      if Assigned(rptContratosMestre_lblResponsavel) then
        if edtResponsavel.Text <> '' then begin
           rptContratosMestre_lblResponsavel.Caption := edtResponsavel.Text;
        end else begin
           rptContratosMestre_lblResponsavel.Caption := '< Todos >';
        end;

      // Status do Contrato
      if Assigned(rptContratosMestre_lblStatus) then
        if chkStatus.Checked then begin
           rptContratosMestre_lblStatus.Caption := cboStatus.Text;
        end else begin
           rptContratosMestre_lblStatus.Caption := '< Todos >';
        end;

      // Mês de Reajuste
      if Assigned(rptContratosMestre_lblReajuste) then
        if chkMesReajuste.Checked then begin
           rptContratosMestre_lblReajuste.Caption := FormatDateTime('dd/mm/yyyy',edtReajusteIni.DateTime) + ' a: ' + FormatDateTime('dd/mm/yyyy',edtReajusteFim.DateTime);
        end else begin
           rptContratosMestre_lblReajuste.Caption := '< Todos >';
        end;

      // Tipo de Contrato
      if Assigned(rptContratosMestre_lblTipoContrato) then
        if dblkTipoContrato.KeyValue <> NULL then
           rptContratosMestre_lblTipoContrato.Caption := cdsTipoContrato.FieldByName('SIGLA').AsString
        else
           rptContratosMestre_lblTipoContrato.Caption := '< Todos >';

      // Mês de Fim
      if Assigned(rptContratosMestre_lblFim) then
        if chkFim.Checked then begin
           rptContratosMestre_lblFim.Caption   := 'Apenas Contratos com término de ' +  FormatDateTime('dd/mm/yyyy',edtEncerradoIni.DateTime) + ' a: ' + FormatDateTime('dd/mm/yyyy',edtEncerradoFim.DateTime);
           rptContratosMestre_lblFim.Visible   := True;
        end else begin
           rptContratosMestre_lblFim.Visible   := False;
        end;

      // Mês de Folha
      if Assigned(rptContratosMestre_lblFolha) then
        if chkFolha.Checked then begin
           rptContratosMestre_lblFolha.Caption := 'Apenas Contratos que geram Folha de ' + FormatDateTime('dd/mm/yyyy',edtFolhaIni.DateTime) + ' a: ' + FormatDateTime('dd/mm/yyyy',edtFolhaFim.DateTime);
           rptContratosMestre_lblFolha.Visible := True;
        end else begin
           rptContratosMestre_lblFolha.Visible := False;
        end;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      with qryContratosMestre do begin

         Close;
         SQL.Text :=
         'SELECT ' + #13 +
         '   IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, ' + #13 +
         '   IM.IMONOME AS NOME_MESTRE, IM.IMOLOGRADOURO, IM.IMONUMERO, ' + #13 +
         '   IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, IM.DSC_CIDADE, IM.DSC_UF, ' + #13 +
         '   IM.IMOCEP, ' + #13 +

         '   C.IDCONTRATOIMOVEL, ' + #13 +
         '   C.CONNUMERO AS NUMERO_CONTRATO, ' + #13 +
         '   C.CONNOME AS NOME_CONTRATO, ' + #13 +
         '   C.CONINDICEREAJUSTE, ' + #13 +
         '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN, ' + #13 +

         '   C.CONDATAINICIO, C.CONDATAFIM, ' + #13 +

         '   C.CONDIAVENCIMENTO AS VENCTO_ALUGUEL, ' + #13 +
         '   C.FLGTIPODIAVENC AS TIPO_DIA, ' + #13 +

         '   C.CONDIASTOLERANCIA, ' + #13 +
         '   C.CONVLRAJUSTADO AS VALOR_ALUGUEL, ' + #13 +

         '   C.CONDATARENEGOC AS DATA_REVISAO, ' + #13 +
         '   C.CONDATAREAJUSTE AS DATA_ULTIMO_REAJUSTE, ' + #13 +
         '   C.CONPROXREAJUSTE AS DATA_PROX_REAJUSTE, ' + #13 +
         '   C.CONDATADENUNCIA AS DATA_DENUNCIA, ' + #13 +
         '   C.CONDATAFIANCAFIM AS DATA_FIM_FIANCA, ' + #13 +
         '   C.CONDATAAVDENUNCIA, ' + #13 +
         '   C.CONDATAAVRENEGOC, ' + #13 +

         '   M.MOESIGLA AS INDICE_REAJUSTE, ' + #13 +

         '   C.CONDATARENEGOC, C.CONDIAVENCIMENTO, ' + #13 +
         '   IM.AREA_TOTAL, ' + #13 +

         '   (DECODE(IM.AREA_TOTAL, 0, 0, (C.CONVLRAJUSTADO / IM.AREA_TOTAL))) AS ALUGUEL_M2, ' + #13 +

         '   PL.RAZAOSOCIAL AS LOCATARIO_RS, ' + #13 +
         '   PL.NOME AS LOCATARIO_NF, ' + #13 +
         '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, ' + #13 +
         '   PA.NOME AS ADMINISTRADORA_NF, ' + #13 +
         '   PR.NOME AS RESPONSAVEL_NF, ' + #13 +

         '   EC.LOGRADOURO, EC.NUMERO, EC.COMPLEMENTO, ' + #13 +
         '   EC.BAIRRO, EC.CEP, ' + #13 +
         '   CID.NOME AS NOME_CIDADE, CID.UF, ' + #13 +
         '   PAIS.NOMEPAIS, ' + #13 +

         '   M.MSGDESCRICAO, ' + #13 +
         '   TC.IDTIPOCONTRIMOB, TC.SIGLA ' + #13 + 

         'FROM ' + #13 +
         '   PESSOA PL, PESSOA PA, PESSOA PR,' + #13 +
         '   CONTRATOIMOVEL C, MOEDA M, ' + #13 +
         '   ENDPESS EC, CIDADES CID, PAIS, MSGBOLETO M, ' + #13 +
         '   TIPOCONTRIMOB TC, ' + #13 +

         '   ( ' + #13 +
         '   SELECT ' + #13 +
         '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL,' + #13 +
         '      IM.IMONOME, IM.IMOLOGRADOURO, IM.IMONUMERO,   ' + #13 +
         '      IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, CIM.NOME AS DSC_CIDADE, CIM.UF AS DSC_UF,' + #13 +
         '      IM.IMOCEP, ' + #13 +
         '      SUM(DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL, DECODE(CX.CIMPERCENTRATEIO, 0, 0, DECODE(I.IMOAREAGERENCIAL, NULL, 0, I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100)))) AS AREA_TOTAL ' + #13 +
         '   FROM ' + #13 +
         '      CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM, CIDADES CIM ' + #13 +
         '   WHERE ' + #13 +
         '      ( CX.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
         '      AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
         '      AND ( I.IDCIDADES = CIM.IDCIDADES(+) ) ' + #13 +
         '   GROUP BY ' + #13 +
         '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL,  ' + #13 +
         '      IM.IMONOME, IM.IMOLOGRADOURO, IM.IMONUMERO,  ' + #13 +
         '      IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, CIM.NOME, CIM.UF,  ' + #13 +
         '      IM.IMOCEP ' + #13 +
         '   ) IM ' + #13 +

         'WHERE ' + #13 +
         '   ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13;

         // filtro por Imóvel Mestre
         if edtImovelMestre.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( IM.IDIMOVEL = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

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
            '   AND ( C.FLGCOBRANCAAUTO = 1 ) ' + #13;
         end;

         // filtro por Tipo de Contrato
         if dblkTipoContrato.KeyValue <> NULL then
           SQL.Text := SQL.Text +
             '   AND ( C.IDTIPOCONTRIMOB = ' + IntToStr(dblkTipoContrato.KeyValue) + ' ) ' + #13;


         SQL.Text := SQL.Text +
         '   AND ( C.IDLOCATARIO = PL.IDPESSOA ) ' + #13 +
         '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + #13 +
         '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) ) ' + #13 +
         '   AND ( C.IDCONTRATOIMOVEL  = IM.IDCONTRATOIMOVEL ) ' + #13 +
         '   AND ( C.IDRESPONSAVEL = PR.IDPESSOA(+) ) ' + #13 +
         '   AND ( PL.IDENDCOBRANCA = EC.IDENDERECO(+) ) ' + #13 +
         '   AND ( PL.IDPESSOA = EC.IDPESSOA(+) ) ' + #13 +
         '   AND ( EC.IDCIDADES = CID.IDCIDADES(+) ) ' + #13 +
         '   AND ( EC.IDPAIS = PAIS.IDPAIS(+) ) ' + #13 +
         '   AND ( C.IDMSGBOLETO = M.IDMSGBOLETO(+) ) ' + #13 +
         '   AND ( C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) ) ' + #13 +

         'ORDER BY ' + #13 +
         '   IM.IMONOME, ' + #13;

         case rdgOrdena.ItemIndex of
            0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME ';
            1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO ';
         end;

         Open;
      end;
   end;

end;



procedure TcfgRelContratosMestre.btnBuscaAdminImovelClick(Sender: TObject);
begin
   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelContratosMestre.FormShow(Sender: TObject);
begin
   inherited;

   iAdminImovel   := -1;
   iResponsavel   := -1;
   iImovelMestre  := -1;

   cboStatus.ItemIndex     := 3;

end;



procedure TcfgRelContratosMestre.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelContratosMestre.btnBuscaResponsavelClick(Sender: TObject);
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



procedure TcfgRelContratosMestre.btnLimpaResponsavelClick(Sender: TObject);
begin
   inherited;

   iResponsavel := -1;
   edtResponsavel.Clear;
end;



procedure TcfgRelContratosMestre.chkStatusClick(Sender: TObject);
begin
   inherited;

   if not(chkStatus.Checked) then cboStatus.ItemIndex := -1;
   cboStatus.Enabled := chkStatus.Checked;
end;



procedure TcfgRelContratosMestre.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelContratosMestre.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure TcfgRelContratosMestre.FormCreate(Sender: TObject);
begin
  inherited;
  if not cdsTipoContrato.Active then
    cdsTipoContrato.Open;
end;

procedure TcfgRelContratosMestre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsTipoContrato.Active then
    cdsTipoContrato.Close;
end;

end.
