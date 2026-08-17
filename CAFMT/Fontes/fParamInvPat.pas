unit fParamInvPat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamInvPat = class(TfrmOkCancelar)
    qryClasse: TwwQuery;
    qryClasseDESCRICAO: TStringField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseIDCLASSEBEM: TFloatField;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryLocalizacao: TwwQuery;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    qryConjunto: TwwQuery;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    grpSelecao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    cmbResponsavel: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
    cmbControle: TComboBox;
    cmbConjunto: TwwDBLookupCombo;
    cmbClasse: TwwDBLookupCombo;
    RdGrpOrdem: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamInvPat: TfrmParamInvPat;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf,  uMensErro;

procedure TfrmParamInvPat.FormCreate(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
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
   Screen.Cursor := crDefault;
end;

procedure TfrmParamInvPat.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryInvPat do
   begin
      Close;
      //----------------------------------------------------------------------------------
      if (cmbControle.Text = 'Total') then
         SQL.Strings[11] := '   AND (B.CONTROLE = ' + #39 + 'T' + #39 + ')'
      else
      if (cmbControle.Text = 'Físico') then
         SQL.Strings[11] := '   AND (B.CONTROLE = ' + #39 + 'F' + #39 + ')'
      else
         SQL.Strings[11] := '';
      //----------------------------------------------------------------------------------
      if (cmbGrupo.Text <> '') then
         SQL.Strings[12] := '   AND (B.IDGRUPO = ' + inttostr(qryGrupoIDGRUPO.AsInteger) + ')'
      else
         SQL.Strings[12] := '';
      //----------------------------------------------------------------------------------
      if (cmbClasse.Text <> '') then
         SQL.Strings[13] := '   AND (B.IDCLASSEBEM = ' + inttostr(qryClasseIDCLASSEBEM.AsInteger) + ')'
      else
         SQL.Strings[13] := '';
      //----------------------------------------------------------------------------------
      if (cmbLocalizacao.Text <> '') then
         SQL.Strings[14] := '   AND (C.IDLOCALIZACAO = ' + inttostr(qryLocalizacaoIDLOCALIZACAO.AsInteger) + ')'
      else
         SQL.Strings[14] := '';
      //----------------------------------------------------------------------------------
      if (cmbResponsavel.Text <> '') then
         SQL.Strings[15] := '   AND (C.IDRESPONSAVEL = ' + inttostr(qryResponsavelIDRESPONSAVEL.AsInteger) + ')'
      else
         SQL.Strings[15] := '';
      //----------------------------------------------------------------------------------
      if (cmbConjunto.Text <> '') then
         SQL.Strings[16] := '   AND (B.IDCONJUNTO = ' + inttostr(qryConjuntoIDCONJUNTO.AsInteger) + ')'
      else
         SQL.Strings[16] := '';
      //----------------------------------------------------------------------------------
      case rdgrpOrdem.ItemIndex  of
         0: SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.DESBEM';
         1: SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.PLACA';
      else
         SQL.Strings[22] := ' ORDER BY L.NOME, CB.DESCRICAO, B.DESBEM';
      end;
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      ppLabel40.Caption := 'Relação de Bens para Levantamento do Inventário Patrimonial';
      qryInvPat.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryInvPat.Open;
      Screen.Cursor := crDefault;
      if qryInvPat.IsEmpty then
         MsgDlg('Não existem bens atendendo os paramêtros fornecidos!','Erro',mtError,[mbOk],0);
   end;
end;

procedure TfrmParamInvPat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupo.Close;
   qryLocalizacao.Close;
   qryResponsavel.Close;
   qryConjunto.Close;
   qryClasse.Close;
end;

end.
