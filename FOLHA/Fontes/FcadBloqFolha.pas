{--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  N. Solicitação: WO28230
 Dt Alteração..: 01/12/2025
 Responsável...: Leandro Pocebon
 Descrição.....: Ajuste na query para não conter ';'
-------------------------------------------------------------------------------N. Solicitação: WO23554
 Dt Alteração..: 12/08/2025
 Responsável...: Paulo Nobre
 Descrição.....: No objeto "qryliberados", foi incluido no SQL a junção com a
                 tabela PESSOA para possibilitar mostrar o nome dos Usuários. 
-------------------------------------------------------------------------------
Pendência   : SOL 206186 KINTANA 1997805
Responsável : Thiago Melo
Data        : 24/05/2013
Descrição   : Funcionalidades sem commmit;
--------------------------------------------------------------------------------------------------}

unit FCadbloqfolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TB97Ctls, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  uCmSqlParams, DBTables, Wwquery, Provider, wwdbdatetimepicker,
  CMDateTimePicker,
  ComCtrls,uCMTypes, Wwkeycb;

type
  Tfrmcadbloqfolha = class(TfrmOkCancelar)
    qry: TwwQuery;
    Panel3: TPanel;
    Label4: TLabel;
    edDataBloqDisp: TCMDateTimePicker;
    bbtnBloqueia: TBitBtn;
    pgcPrincipal: TPageControl;
    tbsUsuarios: TTabSheet;
    pnlUsuSistema: TPanel;
    dbgUsuSistema: TwwDBGrid;
    pnlGrupoUsu: TPanel;
    lblUnidNegoc: TLabel;
    Label1: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    Panel1: TPanel;
    pnlButtons: TPanel;
    BtnExcluir: TSpeedButton;
    BtnExcluirTodos: TSpeedButton;
    BtnIncluirTodos: TSpeedButton;
    BtnIncluir: TSpeedButton;
    pnlUsuDisp: TPanel;
    dbgUsuDiponib: TwwDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    bt_Imprime: TBitBtn;
    qryGrupo: TwwQuery;
    dsgrupo: TwwDataSource;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoNOMEGRUPO: TStringField;
    qryGrupoIDESPACESSO: TFloatField;
    qryliberados: TwwQuery;
    dsliberados: TwwDataSource;
    qryliberadosIDUSUARIO: TFloatField;
    qryliberadosNOMEUSUARIO: TStringField;
    qrybloqueado: TwwQuery;
    dsbloqueado: TwwDataSource;
    qrybloqueadoIDUSUARIO: TFloatField;
    qrybloqueadoNOMEUSUARIO: TStringField;
    qrybloqueadoDATABLOQUEIO: TDateTimeField;
    updbloqueado: TUpdateSQL;
    CmeCadastro: TCmEventosCadastro;
    Label3: TLabel;
    wwIncrementalSearch1: TwwIncrementalSearch;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnBloqueiaClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnExcluirTodosClick(Sender: TObject);
    procedure BtnIncluirTodosClick(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    function dataBloqueio : string;
    procedure dbgUsuDiponibTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgUsuSistemaTitleButtonClick(Sender: TObject;
      AFieldName: String);


  private { Private declarations }

     F_rIDPessoa       : Double;
     F_rIDModulo       : Double;
     F_rIDUsuario      : Double;
     F_bUsaPlanoPatro  : Boolean;

  public  { Public declarations }

     bmPosicao: TBookmark;

  end;



var
  frmcadbloqfolha: Tfrmcadbloqfolha;
  fIddispfinanc:Integer;
  ssMsg : string;
  dDataEnter : TDateTime;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro;




procedure Tfrmcadbloqfolha.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupo.open;
  
  qryliberados.close;
  qryliberados.ParamByName('pIDGRUPO').Value := 0;
  qryliberados.open;

  qrybloqueado.close;
  qrybloqueado.ParamByName('pIDGRUPO').Value := 0;
  qrybloqueado.open;

  qry.close;
  qry.SQL.Text := 'select 1 from bloqueiofolha where databloqueio is not null';
  qry.open;


  if qry.IsEmpty then
     bbtnBloqueia.Caption := 'Bloqueia'
  else
     bbtnBloqueia.Caption := 'Desbloqueia';

end;



procedure Tfrmcadbloqfolha.FormShow(Sender: TObject);
begin
  inherited;
   pgcPrincipal.activepage := tbsUsuarios;
   bbtnConfirmar.Enabled:=False;
   bbtnCancelar.Enabled:=False;
end;



procedure Tfrmcadbloqfolha.bbtnBloqueiaClick(Sender: TObject);
var Dataaux : string;
begin
  inherited;
  Dataaux := FormatDateTime('dd/mm/yyyy',Now);

  if edDataBloqDisp.Date < strtodate(Dataaux) then
  begin
     MessageDlg('A data deverá ser maior ou igual a data atual.', mtWarning, [mbOK], 0);
     Abort;
  end;

  qry.close;
  qry.SQL.Text := 'select count(1) qtde from bloqueiofolha';
  qry.open;

  if qry.fieldbyname('qtde').Value = 0 then
  begin
     MessageDlg('Dados não encontrado.', mtWarning, [mbOK], 0);
     Abort;
  end;

  qry.close;
  qry.SQL.Text := 'select 1 from bloqueiofolha where databloqueio is null';
  qry.open;

  if not qry.IsEmpty then
  begin
     bbtnBloqueia.Caption := 'Desbloqueia';

     // Thiago Melo SOL 206186 Kintana 1997805
     if not dtmBaseDados.dbBaseDados.InTransaction then begin
       dtmBaseDados.dbBaseDados.StartTransaction;
     end;
     // Thiago Melo SOL 206186 Kintana 1997805

     qry.SQL.Text := 'update bloqueiofolha set databloqueio = '+#39+edDataBloqDisp.Text+#39;
     qry.ExecSQL;

     // Thiago Melo SOL 206186 Kintana 1997805
     try
       dtmBaseDados.dbBaseDados.commit;
     except
       on E:EDBEngineError do
       begin
         MostrarErro(E);
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
       end;
     end;
     // Thiago Melo SOL 206186 Kintana 1997805

     MessageDlg('Bloqueio efetuado com sucesso.', mtInformation, [mbOK], 0);
  end
  else
  begin
    bbtnBloqueia.Caption := 'Bloqueia';

    // Thiago Melo SOL 206186 Kintana 1997805
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    // Thiago Melo SOL 206186 Kintana 1997805

    qry.SQL.Text := 'update bloqueiofolha set databloqueio = null';
    qry.ExecSQL;
    // Thiago Melo SOL 206186 Kintana 1997805
    try
      dtmBaseDados.dbBaseDados.commit;
    except
      on E:EDBEngineError do
      begin
        MostrarErro(E);
        dtmBaseDados.dbBaseDados.Rollback;
        Exit;
      end;
    end;
    // Thiago Melo SOL 206186 Kintana 1997805

    MessageDlg('Desbloqueio efetuado com sucesso.', mtInformation, [mbOK], 0);
  end;

end;

procedure Tfrmcadbloqfolha.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryliberados.close;
  if dblcUnidNegoc.Text <> '' then
     qryliberados.ParamByName('pIDGRUPO').Value := qryGrupoIDGRUPO.Value
  else
     qryliberados.ParamByName('pIDGRUPO').Value := 0;
  qryliberados.open;

  qrybloqueado.close;
  if dblcUnidNegoc.Text <> '' then
     qrybloqueado.ParamByName('pIDGRUPO').Value := qryGrupoIDGRUPO.Value
  else
     qrybloqueado.ParamByName('pIDGRUPO').Value := 0;
  qrybloqueado.open;
end;

procedure Tfrmcadbloqfolha.BtnIncluirClick(Sender: TObject);
var rec : integer;
begin
  inherited;
  if not qrybloqueado.IsEmpty then
  begin
    // Thiago Melo SOL 206186 Kintana 1997805
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    // Thiago Melo SOL 206186 Kintana 1997805

     qry.close;
     qry.sql.Text := ('delete from BLOQUEIOFOLHA where IDUSUARIO ='+qrybloqueadoIDUSUARIO.AsString);
     qry.ExecSQL;

     // Thiago Melo SOL 206186 Kintana 1997805
     try
       dtmBaseDados.dbBaseDados.commit;
     except
       on E:EDBEngineError do
       begin
         MostrarErro(E);
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
       end;
     end;
     // Thiago Melo SOL 206186 Kintana 1997805


     rec := qryliberados.RecNo;
     qryliberados.close;
     qryliberados.open;
     rec := qrybloqueado.RecNo;
     qrybloqueado.close;
     qrybloqueado.open;
     qrybloqueado.RecNo := rec ;
  end;
end;

procedure Tfrmcadbloqfolha.BtnExcluirClick(Sender: TObject);
var rec : Integer;
begin
  if not qryliberados.IsEmpty then
  begin
     // Thiago Melo SOL 206186 Kintana 1997805
     if not dtmBaseDados.dbBaseDados.InTransaction then begin
       dtmBaseDados.dbBaseDados.StartTransaction;
     end;
     // Thiago Melo SOL 206186 Kintana 1997805

     qry.close;
     qry.sql.Text := ('insert into BLOQUEIOFOLHA(IDUSUARIO, NOMEUSUARIO,databloqueio) values( '+qryliberadosIDUSUARIO.AsString +','+#39+qryliberadosNOMEUSUARIO.AsString+#39+','+#39+dataBloqueio+#39+')' );
     qry.ExecSQL;

     // Thiago Melo SOL 206186 Kintana 1997805
     try
       dtmBaseDados.dbBaseDados.commit;
     except
       on E:EDBEngineError do
       begin
         MostrarErro(E);
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
       end;
     end;
     // Thiago Melo SOL 206186 Kintana 1997805


     rec := qryliberados.RecNo;
     qryliberados.close;
     qryliberados.open;
     qryliberados.RecNo := rec ;
     qrybloqueado.close;
     qrybloqueado.open;
  end;
end;

procedure Tfrmcadbloqfolha.BtnExcluirTodosClick(Sender: TObject);
begin
  inherited;
  qryliberados.DisableConstraints;
  qryliberados.First;

  // Thiago Melo SOL 206186 Kintana 1997805
  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  // Thiago Melo SOL 206186 Kintana 1997805

  while not qryliberados.Eof do
  begin
     qry.close;
     qry.sql.Text := ('insert into BLOQUEIOFOLHA(IDUSUARIO, NOMEUSUARIO,databloqueio) values( '+qryliberadosIDUSUARIO.AsString +','+#39+qryliberadosNOMEUSUARIO.AsString+#39+','+#39+dataBloqueio+#39+')' );
     qry.ExecSQL;

     qryliberados.Next;
  end;

  // Thiago Melo SOL 206186 Kintana 1997805
  try
    dtmBaseDados.dbBaseDados.commit;
  except
    on E:EDBEngineError do
    begin
      MostrarErro(E);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
    end;
  end;
  // Thiago Melo SOL 206186 Kintana 1997805

  qryliberados.close;
  qryliberados.open;
  qrybloqueado.close;
  qrybloqueado.open;
  qryliberados.EnableConstraints;
end;

procedure Tfrmcadbloqfolha.BtnIncluirTodosClick(Sender: TObject);
begin
  inherited;
  qrybloqueado.First;

  // Thiago Melo SOL 206186 Kintana 1997805
  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  // Thiago Melo SOL 206186 Kintana 1997805

  while not qrybloqueado.eof do
  begin
     qry.close;
     qry.sql.Text := ('delete from BLOQUEIOFOLHA where idusuario = ' + qrybloqueadoIDUSUARIO.AsString);
     qry.ExecSQL;
     qrybloqueado.Next;
  end;

  // Thiago Melo SOL 206186 Kintana 1997805
  try
    dtmBaseDados.dbBaseDados.commit;
  except
    on E:EDBEngineError do
    begin
      MostrarErro(E);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
    end;
  end;
  // Thiago Melo SOL 206186 Kintana 1997805

  qry.close;
  qry.SQL.Text := 'select count(1) qtde from bloqueiofolha';
  qry.open;

  if qry.fieldbyname('qtde').Value = 0 then
     bbtnBloqueia.Caption := 'Bloqueia';

  qryliberados.close;
  qryliberados.open;
  qrybloqueado.close;
  qrybloqueado.open;
end;

procedure Tfrmcadbloqfolha.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  qryliberados.close;
  if dblcUnidNegoc.Text <> '' then
     qryliberados.ParamByName('pIDGRUPO').Value := qryGrupoIDGRUPO.Value
  else
     qryliberados.ParamByName('pIDGRUPO').Value := 0;
  qryliberados.open;

  qrybloqueado.close;
  if dblcUnidNegoc.Text <> '' then
     qrybloqueado.ParamByName('pIDGRUPO').Value := qryGrupoIDGRUPO.Value
  else
     qrybloqueado.ParamByName('pIDGRUPO').Value := 0;
  qrybloqueado.open;
end;


function Tfrmcadbloqfolha.dataBloqueio : string ;
begin
  qry.close;
  qry.SQL.Text := 'select max(databloqueio) data from bloqueiofolha';
  qry.open;
  if not qry.IsEmpty then
     result := qry.fieldbyname('data').asstring
  else
     result := '';

end;

procedure Tfrmcadbloqfolha.dbgUsuDiponibTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  wwIncrementalSearch1.Clear;
  wwIncrementalSearch1.DataSource := dsliberados;
  Label3.Caption := 'Usuários Liberados';
end;

procedure Tfrmcadbloqfolha.dbgUsuSistemaTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  wwIncrementalSearch1.Clear;
  wwIncrementalSearch1.DataSource := dsbloqueado;
  Label3.Caption := 'Usuários Bloqueados';
end;

end.
