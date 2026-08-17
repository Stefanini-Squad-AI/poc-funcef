//------------------------------------------------------------------------------
// ALTERAÇÕES :
//------------------------------------------------------------------------------
// Pendência  : 26245
// Autor      : Gustavo Mendes
// Data       :
// Descrição  : Adicionado um filtro de data de Vencimento por competencia na tela.
//------------------------------------------------------------------------------
// Pendência  :
// Autor      : Daniel Simões
// Data       : 15/02/2006
// Descrição  : Adicionado um filtr na query "qryListagemContrato" que faz o
//              somatório dos valores dos alugueis apenas dos imóveis com as datas
//              dentro da vigência...
//------------------------------------------------------------------------------

unit CRelListagemContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uModuloImobiliario,
  DBCtrls, Provider, DBClient, uCMClientDataSet, Wwdatsrc, Mask, wwdbedit,
  Wwdbspin;

type
  TcfgRelListagemContrato = class(TcfgRel)
    Label1: TLabel;
    rdgVigencia: TRadioGroup;
    rdgOrdenacao: TRadioGroup;
    edtAdminImovel: TEdit;
    btnBuscaAdm: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
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
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;

    // procedimentos definidos
    procedure MontaQuery; override;
    procedure btnBuscaAdmClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
   iAdminImovel : integer;
  public { Public declarations }

  end;



var
  cfgRelListagemContrato: TcfgRelListagemContrato;

implementation
{$R *.DFM}
uses
   dRelAdminImob, uSistema, dLookImobiliario, DMS, uFuncoesImob, UDiasInUteis;


procedure TcfgRelListagemContrato.MontaQuery;
var
  iAnoComp, iMesComp: Word;
  dDtaIni, dDtaFim: TDateTime;

begin
   with dtmRelAdminImob do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoLstContratos.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoLstContratos.Picture := nil;

      if Assigned(rptListagemContratos_lblAdministradora) then
        if edtAdminImovel.Text <> '' then begin
           rptListagemContratos_lblAdministradora.Caption := edtAdminImovel.Text;
        end else begin
           rptListagemContratos_lblAdministradora.Caption := '< Todas >';
        end;

      // Tipo de Contrato
      if Assigned(rptListagemContratos_lblTipoContrato) then
        if dblkTipoContrato.KeyValue <> NULL then
          rptListagemContratos_lblTipoContrato.Caption := cdsTipoContrato.FieldByName('SIGLA').AsString
        else
          rptListagemContratos_lblTipoContrato.Caption := '< Todos >';


      with qryListagemContrato do begin

         SQL.Text :=
         'SELECT ' + chr(13) +
         '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' + chr(13) +
         '   C.CONDATAINICIO, C.CONDATAFIM, ' + chr(13) +
         '   CXI.CONVLRAJUSTADO, C.CONINDICEREAJUSTE, ' + chr(13) + // Daniel Simões - 15/02/2006 -
         '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN, ' + chr(13) +
         '   C.CONPROXREAJUSTE, C.FLGCOMPETALUGUEL, ' + chr(13) +
         '   C.CONDATACARENCIA, C.CONDATAREAJUSTE, ' + chr(13) +
         '   C.CODPORTFORMA, C.IDTIPOCUSTORECIMO, ' + chr(13) +
         '   C.CONDATAFIANCAINI, C.CONDATAFIANCAFIM, ' + chr(13) +

         '   (DECODE(C.FLGCOMPETALUGUEL, ''A'', ''mês anterior'', DECODE(C.FLGCOMPETALUGUEL, ''C'', ''mês corrente'', ''mês posterior''))) AS COMPETENCIA, ' + chr(13) +
         '   (DECODE(C.FLGTIPODIAVENC, ''U'', C.CONDIAVENCIMENTO||''o. dia útil'',''dia ''||C.CONDIAVENCIMENTO)) AS VENCIMENTO, ' + chr(13) +
         '   (C.CONDIASTOLERANCIA||DECODE(FLGTIPODIATOLERA, ''U'', '' dias úteis'', '' dias'')) AS TOLERANCIA, ' + chr(13) +

         '   P.DESCRICAO AS PORTADOR_FORMA, T.DESCCUSTORECIMO, ' + chr(13) +

         '   (DECODE (C.FLGFIANCA, ''A'',''Fiador'', ''F'',''Fiança Bancária'', ''S'',''Outra'', ''O'',''Seguro-Fiança'', ''N'',''Não há'', Null) ) AS FIANCA, ' + chr(13) +

         '   C.CONOBSFIANCA, ' + chr(13) +

         '   M.MOESIGLA, ' + chr(13) +

         '   PL.RAZAOSOCIAL AS LOCATARIO_RS, ' + chr(13) +
         '   PL.NOME AS LOCATARIO_NF, ' + chr(13) +
         '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, ' + chr(13) +
         '   PA.NOME AS ADMINISTRADORA_NF, ' + chr(13) +
         '   DECODE(C.FLGSTATUS, ''R'', ''Rescindido'', ''V'', ''Vigente'', ''Encerrado'') AS STATUS, ' + chr(13) +
         '   TC.SIGLA ' + chr(13) +

         'FROM ' + chr(13) +
         '   PESSOA PL, PESSOA PA, ' + chr(13) +
         '   CONTRATOIMOVEL C, MOEDA M, ' + chr(13) +
         '   PORTADORFORMA P, TIPOCUSTORECIMOV T, ' + chr(13) +
         '   TIPOCONTRIMOB TC ' + chr(13) +

// Daniel Simões - 15/02/2006 - ------------------------------------------------
         '    ,( SELECT CXI.IDCONTRATOIMOVEL, SUM(CXI.CIMVLRAJUSTADO) AS CONVLRAJUSTADO ' + chr(13) +
         '       FROM CONTRATOXIMOVEL CXI ' + chr(13) +
         '       WHERE ( (CXI.CIMDTFIM IS NOT NULL AND SYSDATE BETWEEN CXI.CIMDTINI AND CXI.CIMDTFIM ) OR ' + chr(13) +
         '               (CXI.CIMDTFIM IS NULL AND SYSDATE >= CXI.CIMDTINI ) ) ' + chr(13) +
         '       GROUP BY CXI.IDCONTRATOIMOVEL ) CXI ' + chr(13) +
// Daniel Simões - 15/02/2006 - ------------------------------------------------

         'WHERE ' + chr(13) +
         '      ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + chr(13);

         if edtAdminImovel.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ';

// Gustavo Mendes - 26245 - Inicio
         dDtaIni := Date;

         if (DBspnAno.Value > 0) and (cboMes.ItemIndex >= 0) then
         begin
           iAnoComp := Word(trunc(DBspnAno.Value));
           iMesComp := cboMes.ItemIndex + 1;

           dDtaIni := EncodeDate(iAnoComp, iMesComp, 01);
           dDtaFim := DiasInUteis.UltDiaMes(iAnoComp, iMesComp);

           SQL.Text := SQL.Text +
                       ' AND (C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDtaIni) + ''', ''DD/MM/YYYY'') )' + #13 +
                       ' AND (C.CONDATAFIM <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDtaFim) + ''', ''DD/MM/YYYY'') )' + #13;
         end;
// Gustavo Mendes - 26245 - Fim


         if rdgVigencia.ItemIndex = 0 then
         SQL.Text := SQL.Text +
         '   AND ( ' + #13 +
         '   ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDtaIni) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
         '   ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13;

         // filtro por Tipo de Contrato
         if dblkTipoContrato.KeyValue <> NULL then
           SQL.Text := SQL.Text +
             '   AND ( C.IDTIPOCONTRIMOB = ' + IntToStr(dblkTipoContrato.KeyValue) + ' ) ' + #13;

         SQL.Text := SQL.Text +
         '   AND ( C.IDLOCATARIO = PL.IDPESSOA ) ' + chr(13) +
         '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + chr(13) +
         '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) ) ' + chr(13) +
         '   AND ( C.CODPORTFORMA = P.CODPORTFORMA(+) ) ' + chr(13) +
         '   AND ( C.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+) ) ' + chr(13) +
         '   AND ( C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL(+) ) ' + chr(13) + // Daniel Simões - 15/02/2006 -
         '   AND ( C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) ) ' + chr(13) +

         'ORDER BY ' + chr(13);

         case rdgOrdenacao.ItemIndex of
            0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME ';
            1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO ';
         end;

      end;

      // Abre query detalhe ( fiador )
      qryFiador.Close;
      qryFiador.Open;
   end;
end;

procedure TcfgRelListagemContrato.btnBuscaAdmClick(Sender: TObject);
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

procedure TcfgRelListagemContrato.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;

procedure TcfgRelListagemContrato.FormCreate(Sender: TObject);
begin
  inherited;
  if not cdsTipoContrato.Active then
    cdsTipoContrato.Open;
end;

procedure TcfgRelListagemContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsTipoContrato.Active then
    cdsTipoContrato.Close;
end;

end.
