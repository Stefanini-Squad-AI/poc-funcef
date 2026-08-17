unit FCadAvalista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, uValidaDoc,
  FCadastroCSImob;

type
  TfrmCadAvalista = class(TfrmCadastroCSImob)
    Label1: TLabel;
    DBedtNome: TDBEdit;
    Label2: TLabel;
    DBEditOrigem: TDBEdit;
    Label3: TLabel;
    DBEditRenda: TDBEdit;
    Label4: TLabel;
    DBEditMargem: TDBEdit;
    qryAux: TwwQuery;
    Label5: TLabel;
    DBEditCPF: TDBEdit;
    CPF: TCMValidaDoc;
    qryIDAVALISTA: TFloatField;
    qryCPF: TStringField;
    qryMARGEMCONSIG: TFloatField;
    qryNOME: TStringField;
    qryORIGEMREND: TStringField;
    qryRENDACOMP: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure DBEditCPFExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    iIdContratoEmptmo : Int64;
    procedure Sel(i: int64);
  public
    { Public declarations }
    property pIdContratoEmptmo : Int64  read iIdContratoEmptmo write iIdContratoEmptmo;
  end;

var
  frmCadAvalista: TfrmCadAvalista;

implementation

uses FCadInscricao, uMensErro, UDataBase, UFuncoesEmptmo;

{$R *.DFM}

procedure TfrmCadAvalista.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBedtNome.Setfocus;
end;



procedure TfrmCadAvalista.DBEditCPFExit(Sender: TObject);
begin
  inherited;
  CPF.NumDocumento := DBEditCPF.Text;
  CPF.DocumentoValido;
end;



procedure TfrmCadAvalista.FormClose(Sender: TObject; var Action: TCloseAction);
begin

	FechaQueries;

   inherited;

end;



procedure TfrmCadAvalista.Sel(i: int64);
begin
   // abre a query principal com os parâmetros passados
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDAVALISTA').AsInteger   := i;
      Open;
   end;

end;



procedure TfrmCadAvalista.CmeCadastroInsert(Sender: TObject);
begin
   DBedtNome.SetFocus;
	// abre a query principal contendo zero registros
   Sel(-1);

	inherited;
end;



procedure TfrmCadAvalista.CmeCadastroConfirma(Sender: TObject);
var sSql, sNome : String;
    iId : Integer;
begin
   if qry.State = dsInsert then begin
      qryIDAVALISTA.AsInteger := LeUltRegistro('PESSOA');
      sSql := 'INSERT INTO PESSOA(IDPESSOA,NOME) VALUES(' +
              qryIDAVALISTA.asString + ',' +chr(39)+ qryNOME.asString +chr(39)+ ')';
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      try
         StartTransacao;
         qryAux.ExecSQL;

         sSql := 'INSERT INTO CONTRATOXAVALISTA(IDCONTRATOEMPTMO,IDAVALISTA) VALUES(' +
                  IntToStr(iIdContratoEmptmo) + ',' + qryIDAVALISTA.asString + ')';
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSql);
         try
            qryAux.ExecSQL;
         except
            if InTransacao then
               RollBackTransacao;
            MsgDlg('Não foi possível Inserir Avalista para o Contrato!', 'Erro', mtError, [mbOk], 0);
            Exit;
         end;(* try..except *)
         CommitTransacao;

      except
         if InTransacao then
            RollBackTransacao;
         MsgDlg('Não foi possível Inserir Avalista!', 'Erro', mtError, [mbOk], 0);
         Exit;
      end;(* try..except *)
   end;(* if qry.State *)

   if qry.State = dsEdit then begin
      sSql := 'UPDATE PESSOA SET NOME = ' +chr(39)+ qryNOME.asString +chr(39)+ #13 + 
              'WHERE IDPESSOA = ' + qryIDAVALISTA.asString;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Não foi possível Alterar Avalista!', 'Erro', mtError, [mbOk], 0);
         Exit;
      end;(* try..except *)
   end;(* if qry.State *)

   iId   := qryIDAVALISTA.AsInteger;
   sNome := qryNOME.asString;

   if qry.State in dsEditModes then begin

      inherited;

   end;

   (* volta para o FrmCadInscrição *)
   Close;

end;



procedure TfrmCadAvalista.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

	if DBedtNome.CanFocus then DBedtNome.SetFocus;

end;



procedure TfrmCadAvalista.CmeCadastroFind(Sender: TObject);
begin
	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      // abre a query
      Sel(StrToInt(MontaSelect.ValoresChave[0]));

      Screen.Cursor := crDefault;
   end;

end;



procedure TfrmCadAvalista.sbtnApagarClick(Sender: TObject);
var
   sSQL : String;
begin
   try
      StartTransacao;
      sSql := 'DELETE FROM CONTRATOXAVALISTA'                           + #13 +
              'WHERE IDCONTRATOEMPTMO = ' + IntToSTr(iIdContratoEmptmo) + #13 +
              'AND   IDAVALISTA       = ' + qryIDAVALISTA.asString      + #13;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      qryAux.ExecSQL;

      inherited;

      CommitTransacao;
   except
      if InTransacao then
         RollBackTransacao;
      MsgDlg('Não foi possível Excluir Avalista para o Contrato!', 'Erro', mtError, [mbOk], 0);
      Exit;
   end;(* try..except *)

end;

end.
