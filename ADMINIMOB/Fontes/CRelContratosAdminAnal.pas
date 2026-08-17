//------------------------------------------------------------------------------
// ALTERAÇÕES :
{-------------------------------------------------------------------------------
Pendência  : 21822
Autor      : Daniel Simões
Data       : 13/06/2006
Descrição  : Adicionado o Código do Imóvel no relatório Imóveis po Contratos
             Analíticos...
--------------------------------------------------------------------------------
Pendência  :
Autor      : Daniel Simões
Data       : 15/02/2006
Descrição  : Adicionado o filtro que pega apenas os imóveis dentro da vigência
             do contrato ( "qryContratosAdminAnal" ) ...
-------------------------------------------------------------------------------}

unit CRelContratosAdminAnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uModuloImobiliario,
  Provider, DBClient, uCMClientDataSet, Wwdatsrc, DBCtrls;

type
  TcfgRelContratosAdminAnal = class(TcfgRel)
    Label1: TLabel;
    rdgVigencia: TRadioGroup;
    rdgOrdena: TRadioGroup;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    chkAluguel: TCheckBox;
    Label2: TLabel;
    btnBuscaContrato: TBitBtn;
    edtConNome: TEdit;
    edtConNumero: TEdit;
    btnLimpaContrato: TBitBtn;
    Label3: TLabel;
    btnLimpaAdminImovel: TBitBtn;
    Label4: TLabel;
    edtResponsavel: TEdit;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaResponsavel: TBitBtn;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    dblkTipoContrato: TDBLookupComboBox;
    lblTipoContrato: TLabel;
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

    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
    sContrato     : string;
    iAdminImovel  : integer;
    iResponsavel  : integer;
    iImovelMestre : integer;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelContratosAdminAnal: TcfgRelContratosAdminAnal;



implementation
{$R *.DFM}
Uses
   uSistema, dRelAdminImob, dLookImobiliario, DMS;



procedure TcfgRelContratosAdminAnal.MontaQuery;
begin
   with dtmRelAdminImob do begin

      // Os "if Assigned()" a seguir testa se os objetos existem porque o usuário
      // pode ter alterado o mesmo.

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoContratosAnal.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoContratosAnal.Picture := nil;

      // Administradora
      if Assigned(rptContratosAdminAnal_lblAdministradora) then
        if edtAdminImovel.Text <> '' then begin
           rptContratosAdminAnal_lblAdministradora.Caption := edtAdminImovel.Text;
        end else begin
           rptContratosAdminAnal_lblAdministradora.Caption := '< Todas >';
        end;

      // Responsável
      if Assigned(rptContratosAdminAnal_lblResponsavel) then
        if edtResponsavel.Text <> '' then begin
           rptContratosAdminAnal_lblResponsavel.Caption := edtResponsavel.Text;
        end else begin
           rptContratosAdminAnal_lblResponsavel.Caption := '< Todos >';
        end;

      // preenche a label que indica se serão só exibidos Imóveis com Aluguel > 0
      if Assigned(rptContratosAdminAnal_lblAluguelImovel) then
        rptContratosAdminAnal_lblAluguelImovel.Visible := chkAluguel.Checked;
      bAluguel := chkAluguel.Checked;

      // Tipo de Contrato
      if Assigned(rptContratosAdminAnal_lblTipoContrato) then
        if dblkTipoContrato.KeyValue <> NULL then
          rptContratosAdminAnal_lblTipoContrato.Caption := cdsTipoContrato.FieldByName('SIGLA').AsString
        else
          rptContratosAdminAnal_lblTipoContrato.Caption := '< Todos >';

      with qryContratosAdminAnal do begin

         SQL.Text :=
         'SELECT ' + #13 +
         '   C.IDCONTRATOIMOVEL, ' + #13 +
         '   C.CONNUMERO, C.CONNOME, ' + #13 +
         '   C.CONDATAINICIO, C.CONDATAFIM, ' + #13 +
         '   C.CONVLRAJUSTADO, C.CONINDICEREAJUSTE, ' + #13 +
         '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN, C.CONPROXREAJUSTE, ' + #13 +
         '   CX.IDIMOVEL, CX.CIMVLRAJUSTADO, CX.CIMDESCRICAO, ' + #13 +
         '   CX.FLGRATEIO, CX.CIMPERCENTRATEIO, ' + #13 +

         '   I.IMOCODIGO AS CODIGO_IMOVEL,  ' + #13 + // Daniel Simões - 21822
         '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL, ' + #13 +
         '   (IM.IMONOME||'' - ''||I.IMONOME) AS IMOVEL_EXTENSO, ' + #13 +
         '   DECODE(CX.FLGRATEIO, NULL, I.IMOAREAGERENCIAL, ' + #13 +
         '      DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL, ' + #13 +
         '         DECODE(CX.CIMPERCENTRATEIO, 0, 0, ' + #13 +
         '            DECODE(I.IMOAREAGERENCIAL, NULL, 0, ' + #13 +
         '               I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100 ' + #13 +
         '            ) ' + #13 +
         '         ) ' + #13 +
         '      ) ' + #13 +
         '   ) AS AREA_OCUPADA, ' + #13 +

         '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0, CX.CIMVLRAJUSTADO) AS ALUGUEL, ' + #13 +

         '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0, ' + #13 +
         '      DECODE(I.IMOAREAGERENCIAL, NULL, 0, ' + #13 +
         '         DECODE(I.IMOAREAGERENCIAL, 0, 0, ' + #13 +
         '            DECODE(CX.FLGRATEIO, NULL, (CX.CIMVLRAJUSTADO / I.IMOAREAGERENCIAL), ' + #13 +
         '               DECODE(CX.FLGRATEIO, 0, (CX.CIMVLRAJUSTADO / I.IMOAREAGERENCIAL), ' + #13 +
         '                  DECODE(CX.CIMPERCENTRATEIO, NULL, 0, ' + #13 +
         '                     DECODE(CX.CIMPERCENTRATEIO, 0, 0, ' + #13 +
         '                        (CX.CIMVLRAJUSTADO / (I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100)) ' + #13 +
         '                     ) ' + #13 +
         '                  ) ' + #13 +
         '               ) ' + #13 +
         '            ) ' + #13 +
         '         ) ' + #13 +
         '      ) ' + #13 +
         '   ) AS ALUGUELM2, ' + #13 +

         '   M.MOESIGLA, ' + #13 +

         '   PL.RAZAOSOCIAL AS LOCATARIO_RS, ' + #13 +
         '   PL.NOME AS LOCATARIO_NF, ' + #13 +
         '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, ' + #13 +
         '   PA.NOME AS ADMINISTRADORA_NF, ' + #13 +
         '   TC.SIGLA ' + #13 +

         'FROM ' + #13 +
         '   CONTRATOIMOVEL C, CONTRATOXIMOVEL CX, ' + #13 +
         '   MOEDA M, PESSOA PL, PESSOA PA, ' + #13 +
         '   IMOVEL I, IMOVEL IM, ' + #13 +
         '   TIPOCONTRIMOB TC ' + #13 +

         'WHERE ' + #13;

         SQL.Text := SQL.Text +
         '   ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ';

         if sContrato <> '' then
         SQL.Text := SQL.Text + #13 +
         '   AND ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) ' + #13;

         if edtAdminImovel.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + #13;

         // filtro por Responsável
         if edtResponsavel.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( C.IDRESPONSAVEL = ' + IntToStr(iResponsavel) + ' ) ' + #13;

         if edtImovelMestre.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( IM.IDIMOVEL = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

         if rdgVigencia.ItemIndex = 0 then
         SQL.Text := SQL.Text +
// Daniel Simões - 15/02/2006 - ------------------------------------------------

         '   AND ( (CX.CIMDTFIM IS NOT NULL AND SYSDATE BETWEEN CX.CIMDTINI AND CX.CIMDTFIM ) OR '+#13+
         '         (CX.CIMDTFIM IS NULL AND SYSDATE >= CX.CIMDTINI ) )                           '+#13;

// Daniel Simões - 15/02/2006 - ------------------------------------------------

         // filtro por Tipo de Contrato
         if dblkTipoContrato.KeyValue <> NULL then
           SQL.Text := SQL.Text +
             '   AND ( C.IDTIPOCONTRIMOB = ' + IntToStr(dblkTipoContrato.KeyValue) + ' ) ' + #13;

         SQL.Text := SQL.Text +
         '   AND ( I.FLGTIPOIMOVEL = 1 ) ' + #13 +
         '   AND ( IM.FLGTIPOIMOVEL = 0 ) ' + #13 +
         '   AND ( C.IDLOCATARIO = PL.IDPESSOA ) ' + #13 +
         '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + #13 +
         '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) ) ' + #13 +
         '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL ) ' + #13 +
         '   AND ( CX.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
         '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL ) ' +#13+ // Daniel Simões - 15/02/2006 -
         '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
         '   AND ( C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) ) ' + #13 +

         'ORDER BY ' + #13;

         Case rdgOrdena.ItemIndex of
            0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME, IMOVEL_EXTENSO ';
            1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO, IMOVEL_EXTENSO ';
         end;

         Open;
      end;
   end;
end;



procedure TcfgRelContratosAdminAnal.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

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



procedure TcfgRelContratosAdminAnal.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelContratosAdminAnal.btnBuscaContratoClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Contrato.Executar;
   // dtmMS.MS_Contrato.CamposChave
   //    [0] C.IDCONTRATOIMOVEL
   //    [1] C.CONNUMERO
   //    [2] C.CONNOME

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor     := crHourGlass;

      sContrato         := dtmMS.MS_Contrato.ValoresChave[0];
      edtConNumero.Text := dtmMS.MS_Contrato.ValoresChave[1];
      edtConNome.Text   := dtmMS.MS_Contrato.ValoresChave[2];

      Screen.Cursor     := crDefault;
   end;
end;



procedure TcfgRelContratosAdminAnal.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelContratosAdminAnal.FormShow(Sender: TObject);
begin
   inherited;

   sContrato      := '';
   iAdminImovel   := -1;
   iResponsavel   := -1;
   iImovelMestre  := -1;
end;



procedure TcfgRelContratosAdminAnal.btnBuscaResponsavelClick(Sender: TObject);
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



procedure TcfgRelContratosAdminAnal.btnLimpaResponsavelClick(Sender: TObject);
begin
   inherited;

   iResponsavel := -1;
   edtResponsavel.Clear;
end;



procedure TcfgRelContratosAdminAnal.btnBuscaImovelMestreClick(Sender: TObject);
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



procedure TcfgRelContratosAdminAnal.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure TcfgRelContratosAdminAnal.FormCreate(Sender: TObject);
begin
  inherited;
  if not cdsTipoContrato.Active then
    cdsTipoContrato.Open;
end;

procedure TcfgRelContratosAdminAnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsTipoContrato.Active then
    cdsTipoContrato.Close;
end;

end.

