unit fParamConjxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamConjxBens = class(TfrmOkCancelar)
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
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbLocalizacaoExit(Sender: TObject);
    procedure cmbResponsavelExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iLocal, iResp : Integer;
  end;

var
  frmParamConjxBens: TfrmParamConjxBens;

implementation

uses dAtivoFixo, dRelCadCaf, uSistema,  uMensErro;

{$R *.DFM}

procedure TfrmParamConjxBens.FormCreate(Sender: TObject);
begin
   inherited;
   qryLocalizacao.Open;
   qryResponsavel.Open;
   iLocal := 0;
   iResp  := 0;
end;
//========================================================================================
procedure TfrmParamConjxBens.FormActivate(Sender: TObject);
begin
   inherited;
   cmbLocalizacao.SetFocus;
end;
//========================================================================================
procedure TfrmParamConjxBens.cmbLocalizacaoExit(Sender: TObject);
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
procedure TfrmParamConjxBens.cmbResponsavelExit(Sender: TObject);
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
procedure TfrmParamConjxBens.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with dtmRelCadCaf do
   begin
      qryConjxBens.Close;
      if (iLocal <> 0) then
      begin
         qryConjxBens.SQL.Strings[7] := 'AND (C.IDLOCALIZACAO = '+IntToStr(iLocal)+')';
      end else
      begin
         qryConjxBens.SQL.Strings[7] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if (iResp <> 0) then
      begin
         qryConjxBens.SQL.Strings[8] := 'AND (C.IDRESPONSAVEL = '+IntToStr(iResp)+')';
      end else
      begin
         qryConjxBens.SQL.Strings[8] := ' ';
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      qryConjxBens.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      //----------------------------------------------------------------------------------
      qryConjxBens.Open;
      Screen.Cursor := crDefault;
      if qryConjxBens.IsEmpty then
         MsgDlg('Não há dados para os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamConjxBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryLocalizacao.Close;
   qryResponsavel.Close;
end;

end.
