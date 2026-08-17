unit fParamBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
    Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBem = class(TfrmOkCancelar)
    qryGrupo: TwwQuery;
    qryLocalizacao: TwwQuery;
    qryResponsavel: TwwQuery;
    RdGrpOrdem: TRadioGroup;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    grpSelecao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    cmbResponsavel: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
    cmbControle: TComboBox;
    Label3: TLabel;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    grpMovim: TGroupBox;
    dteDataMov: TCMDateTimePicker;
    qryConjunto: TwwQuery;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    cmbConjunto: TwwDBLookupCombo;
    Label1: TLabel;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    Label4: TLabel;
    Label7: TLabel;
    cmbClasse: TwwDBLookupCombo;
    qryClasse: TwwQuery;
    qryClasseDESCRICAO: TStringField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseIDCLASSEBEM: TFloatField;
    rdgBaixados: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlaca, sMascaraEmpresa : String;

  end;

var
  frmParamBem: TfrmParamBem;

implementation

{$R *.DFM}

uses uSistema, dRelCadCaf,  uMensErro, dAtivoFixo;

procedure TfrmParamBem.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   // Seleção de Grupo
   qryClasse.Open;
   // Seleção de Grupo
   qryGrupo.Open;
   // Seleção de Localização
   qryLocalizacao.Open;
   // Seleção de Responsavel
   qryResponsavel.Open;
   // Seleção de Conjunto
   qryConjunto.Open;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      sMascaraEmpresa := '';
      for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
      begin
         sMascaraEmpresa := sMascaraEmpresa + '#';
      end;
      //----------------------------------------------------------------------------------
      sMascaraGrupo  := FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      if (FieldByName('SEQBEMEMP').AsFloat = 0) then
      begin
         sMascaraPlaca := sMascaraEmpresa + '.#########;0; ';
      end else
      begin
         sMascaraPlaca := sMascaraGrupo   + '.#######;0; '
      end;
      //----------------------------------------------------------------------------------
      Close;
   end;
   //-------------------------------------------------------------------------------------
   dteDataMov.Date := date;
end;
//----------------------------------------------------------------------------------------
procedure TfrmParamBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelCadCaf.qryBem do
   begin
      Close;
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Total' then
         SQL.Strings[45] := '   AND (B.CONTROLE = ' + #39 + 'T' + #39 + ')'
      else
      if cmbControle.Text = 'Físico' then
         SQL.Strings[45] := '   AND (B.CONTROLE = ' + #39 + 'F' + #39 + ')'
      else
         SQL.Strings[45] := ' ';
      //----------------------------------------------------------------------------------
      if cmbGrupo.Text <> '' then
         SQL.Strings[46] := '   AND (B.IDGRUPO = ' + inttostr(qryGrupoIDGRUPO.AsInteger) + ')'
      else
         SQL.Strings[46] := ' ';
      //----------------------------------------------------------------------------------
      if cmbClasse.Text <> '' then
         SQL.Strings[47] := '   AND (B.IDCLASSEBEM = ' + inttostr(qryClasseIDCLASSEBEM.AsInteger) + ')'
      else
         SQL.Strings[47] := ' ';
      //----------------------------------------------------------------------------------
      if cmbLocalizacao.Text <> '' then
         SQL.Strings[48] := '   AND (C.IDLOCALIZACAO = ' + inttostr(qryLocalizacaoIDLOCALIZACAO.AsInteger) + ')'
      else
         SQL.Strings[48] := ' ';
      //----------------------------------------------------------------------------------
      if cmbResponsavel.Text <> '' then
         SQL.Strings[49] := '   AND (C.IDRESPONSAVEL = ' + inttostr(qryResponsavelIDRESPONSAVEL.AsInteger) + ')'
      else
         SQL.Strings[49] := ' ';
      //----------------------------------------------------------------------------------
      if cmbConjunto.Text <> '' then
         SQL.Strings[50] := '   AND (B.IDCONJUNTO = ' + inttostr(qryConjuntoIDCONJUNTO.AsInteger) + ')'
      else
         SQL.Strings[50] := ' ';
      //----------------------------------------------------------------------------------
      if dteDataIni.Text <> '' then
         SQL.Strings[51] := '   AND (B.DTAINCLUSAO >= TO_DATE(' + #39 + dteDataIni.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))'
      else
         SQL.Strings[51] := ' ';
      //----------------------------------------------------------------------------------
      if dteDataFim.Text <> '' then
         SQL.Strings[52] := '   AND (B.DTAINCLUSAO <= TO_DATE(' + #39 + dteDataFim.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))'
      else
         SQL.Strings[52] := ' ';
      //----------------------------------------------------------------------------------
      case rdgBaixados.ItemIndex of
         0: SQL.Strings[53] := '   AND ((B.BAIXATOTAL = '+#39+'N'+#39+') OR (B.BAIXATOTAL IS NULL))';
         1: SQL.Strings[53] := '   AND (NOT ((B.BAIXATOTAL = '+#39+'N'+#39+') OR (B.BAIXATOTAL IS NULL)))';
         2: SQL.Strings[53] := ' ';
      else
         SQL.Strings[53] := ' ';
      end;
      //----------------------------------------------------------------------------------
      case rdgrpOrdem.ItemIndex  of
         0: SQL.Strings[66] := ' ORDER BY B.DESBEM';
         1: SQL.Strings[66] := ' ORDER BY B.PLACA';
         2: SQL.Strings[66] := ' ORDER BY G.NOME';
         3: SQL.Strings[66] := ' ORDER BY PR.NOME';
         4: SQL.Strings[66] := ' ORDER BY L.NOME';
         5: SQL.Strings[66] := ' ORDER BY B.IDCONJUNTO';
      else
         SQL.Strings[66] := ' ORDER BY G.NOME';
      end;
      //----------------------------------------------------------------------------------
      ParamByName('PDATASLD').AsDateTime := dteDataMov.Date;
      ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   end;
   //-------------------------------------------------------------------------------------
   dtmRelCadCaf.rpBemCalc1.DisplayFormat := sMascaraPlaca;
   with dtmRelCadCaf do
   begin
      rpBemCabec.Caption := 'Cadastro Patrimonial de Bens em ' + dteDataMov.Text;
      qryBem.Open;
      Screen.Cursor := crDefault; 
      if qryBem.IsEmpty then
         MsgDlg('Parâmetros Inválidos!','Erro',mtError,[mbOk],0);
   end;
end;
//----------------------------------------------------------------------------------------
procedure TfrmParamBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupo.Close;
   qryLocalizacao.Close;
   qryResponsavel.Close;
   qryConjunto.Close;
   qryClasse.Close;
end;

end.


