unit fParamCadConj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamCadConj = class(TfrmOkCancelar)
    qryLocalizacao: TwwQuery;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    Label8: TLabel;
    cmbLocalizacao: TwwDBLookupCombo;
    Label5: TLabel;
    cmbResponsavel: TwwDBLookupCombo;
    procedure cmbLocalizacaoExit(Sender: TObject);
    procedure cmbResponsavelExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iLocal, iResp : Integer;
  end;

var
  frmParamCadConj: TfrmParamCadConj;

implementation

uses dAtivoFixo, dRelCadCaf, uSistema,  uMensErro;

{$R *.DFM}


procedure TfrmParamCadConj.FormCreate(Sender: TObject);
var
   iAux       : Integer;
   sMascaraCC : String;
begin
   inherited;
   qryLocalizacao.Open;
   qryResponsavel.Open;
   iLocal := 0;
   iResp  := 0;
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.qryParamGlobal.Close;
   dtmAtivoFixo.qryParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmAtivoFixo.qryParamGlobal.Open;
   sMascaraCC := dtmAtivoFixo.qryParamGlobal.FieldByName('MASCARACC').AsString;
   dtmAtivoFixo.qryParamGlobal.Close;
   //-------------------------------------------------------------------------------------
   iAux := 1;
   while iAux <= length(sMascaraCC) do
   begin
      if sMascaraCC[iAux] = '9' then
         sMascaraCC[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraCC := sMascaraCC + ';0; ';
end;
//========================================================================================
procedure TfrmParamCadConj.FormActivate(Sender: TObject);
begin
   inherited;
   cmbLocalizacao.SetFocus;
end;
//========================================================================================
procedure TfrmParamCadConj.cmbLocalizacaoExit(Sender: TObject);
begin
   inherited;
   if (cmbLocalizacao.Text <> '') then
   begin
      iLocal := qryLocalizacaoIDLOCALIZACAO.AsInteger;
   end else
   begin
      iLocal := 0;
   end;
end;
//========================================================================================
procedure TfrmParamCadConj.cmbResponsavelExit(Sender: TObject);
begin
   inherited;
   if (cmbResponsavel.Text <> '') then
   begin
      iResp := qryResponsavelIDRESPONSAVEL.AsInteger;
   end else
   begin
      iResp := 0;
   end;
end;
//========================================================================================
procedure TfrmParamCadConj.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with dtmRelCadCaf do
   begin
      qryCadConj.Close;
      if (iLocal <> 0) then
      begin
         qryCadConj.SQL.Strings[8] := 'AND (C.IDLOCALIZACAO = '+IntToStr(iLocal)+')';
      end else
      begin
         qryCadConj.SQL.Strings[8] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if (iResp <> 0) then
      begin
         qryCadConj.SQL.Strings[9] := 'AND (C.IDRESPONSAVEL = '+IntToStr(iResp)+')';
      end else
      begin
         qryCadConj.SQL.Strings[9] := ' ';
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      qryCadConj.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      //----------------------------------------------------------------------------------
      qryCadConj.Open;
      Screen.Cursor := crDefault;
      if qryCadConj.IsEmpty then
         MsgDlg('Não há dados para os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   end;
end;

procedure TfrmParamCadConj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryLocalizacao.Close;
   qryResponsavel.Close;
end;

end.
