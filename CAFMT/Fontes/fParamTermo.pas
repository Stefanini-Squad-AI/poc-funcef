unit fParamTermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamTermo = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    qryLocalizacao: TwwQuery;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDPESSOA: TFloatField;
    qryConjunto: TwwQuery;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    Label1: TLabel;
    dblkcmbLocal: TwwDBLookupCombo;
    Label2: TLabel;
    dblkcmbResp: TwwDBLookupCombo;
    Label3: TLabel;
    dblkcmbConjunto: TwwDBLookupCombo;
    rdgTermo: TRadioGroup;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure dblkcmbLocalExit(Sender: TObject);
    procedure dblkcmbRespExit(Sender: TObject);
    procedure dblkcmbConjuntoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdLocal, iIdResp, iIdConjunto : Integer;
  end;

var
  frmParamTermo: TfrmParamTermo;

implementation

uses uSistema, uMensErro, dRelOperCaf;

{$R *.DFM}

procedure TfrmParamTermo.FormActivate(Sender: TObject);
begin
   inherited;
   qryLocalizacao.Prepare;
   qryLocalizacao.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryResponsavel.Prepare;
   qryConjunto.Prepare;
   qryConjunto.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   //-------------------------------------------------------------------------------------
   qryLocalizacao.Open;
   qryResponsavel.Open;
   qryConjunto.Open;
end;

procedure TfrmParamTermo.dblkcmbLocalExit(Sender: TObject);
begin
   inherited;
   if dblkcmbLocal.Text <> '' then
      iIdLocal := qryLocalizacaoIDLOCALIZACAO.AsInteger
   else
      iIdLocal := 0;
end;

procedure TfrmParamTermo.dblkcmbRespExit(Sender: TObject);
begin
   inherited;
   if dblkcmbResp.Text <> '' then
      iIdResp := qryResponsavelIDPESSOA.AsInteger
   else
      iIdResp := 0;
end;

procedure TfrmParamTermo.dblkcmbConjuntoExit(Sender: TObject);
begin
   inherited;
   if dblkcmbConjunto.Text <> '' then
      iIdConjunto := qryConjuntoIDCONJUNTO.AsInteger
   else
      iIdConjunto := 0;
end;

procedure TfrmParamTermo.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   dtmRelOperCaf.qryTermo.Close;
   dtmRelOperCaf.qryTermo.SQL.Clear;
   //-------------------------------------------------------------------------------------
   dtmRelOperCaf.qryTermo.SQL.Add(' SELECT L.NOME AS DESCLOCAL,P.NOME AS NOMERESP, ');
   dtmRelOperCaf.qryTermo.SQL.Add('        TA.DESCTIPOAREA,B.PLACA,B.DESBEM ');
   dtmRelOperCaf.qryTermo.SQL.Add(' FROM   BEM         B,  ');
   dtmRelOperCaf.qryTermo.SQL.Add('        CONJUNTO    C,  ');
   dtmRelOperCaf.qryTermo.SQL.Add('        LOCALIZACAO L,  ');
   dtmRelOperCaf.qryTermo.SQL.Add('        TIPOAREA    TA, ');
   dtmRelOperCaf.qryTermo.SQL.Add('        RESPONSAVEL R,  ');
   dtmRelOperCaf.qryTermo.SQL.Add('        PESSOA      P   ');
   dtmRelOperCaf.qryTermo.SQL.Add(' WHERE (B.BAIXATOTAL <> ' + #39 + 'S' + #39 + ') AND ');
   //-------------------------------------------------------------------------------------
   if iIdLocal <> 0 then
      dtmRelOperCaf.qryTermo.SQL.Add(' (C.IDLOCALIZACAO = ' + inttostr(iIdLocal) + ') AND ');
   if iIdResp <> 0 then
      dtmRelOperCaf.qryTermo.SQL.Add(' (C.IDRESPONSAVEL = ' + inttostr(iIdResp) + ') AND ');
   if iIdConjunto <> 0 then
      dtmRelOperCaf.qryTermo.SQL.Add(' (C.IDCONJUNTO = ' + inttostr(iIdConjunto) + ') AND ');
   //-------------------------------------------------------------------------------------
   dtmRelOperCaf.qryTermo.SQL.Add('        (C.IDCONJUNTO    = B.IDCONJUNTO)    ');
   dtmRelOperCaf.qryTermo.SQL.Add('   AND  (C.IDLOCALIZACAO = L.IDLOCALIZACAO) ');
   dtmRelOperCaf.qryTermo.SQL.Add('   AND  (L.IDTIPOAREA    = TA.IDTIPOAREA)   ');
   dtmRelOperCaf.qryTermo.SQL.Add('   AND  (C.IDRESPONSAVEL = R.IDRESPONSAVEL) ');
   dtmRelOperCaf.qryTermo.SQL.Add('   AND  (P.IDPESSOA      = R.IDRESPONSAVEL) ');
   //-------------------------------------------------------------------------------------
   case rdgTermo.ItemIndex  of
      0 : dtmRelOperCaf.qryTermo.SQL.Add(' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM');
      1 : dtmRelOperCaf.qryTermo.SQL.Add(' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.DESBEM, B.PLACA');
   else
      dtmRelOperCaf.qryTermo.SQL.Add(' ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM');
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qryTermo.Open;
      Screen.Cursor := crDefault;
      if qryTermo.IsEmpty then
         if iIdLocal <> 0 then
            MsgDlg('Não há bens para essa Localização !','Erro',mtError,[mbOk],0)
         else
         if iIdResp <> 0 then
            MsgDlg('Não há bens para esse Responsável !','Erro',mtError,[mbOk],0)
         else
            MsgDlg('Não há bens com os Parâmetros selecionados !','Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamTermo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryLocalizacao.Close;
   qryResponsavel.Close;
   qryConjunto.Close;
   //-------------------------------------------------------------------------------------
   qryLocalizacao.UnPrepare;
   qryResponsavel.UnPrepare;
   qryConjunto.UnPrepare;
end;

end.
