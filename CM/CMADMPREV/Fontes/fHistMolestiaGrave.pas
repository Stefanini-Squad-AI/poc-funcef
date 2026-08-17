unit FHistMolestiaGrave;

//Alterações:
{
--------------------------------------------------------------------------------------------------
Alteração........: sbtnInsDet, sbtnAltDet
Nº SIG:........... 63063
Data da Alteração: 03/04/2018
Responsável......: Taffarel Sevaybriker
Descrição........: Alterada funcionalidade de moléstia para habilitar inclusão/exclusão de datas
                   apenas no modo alterar do cadastro.
--------------------------------------------------------------------------------------------------
Alteração........: (dfm DBGrid1 columns.title)
Nº SIG:........... 33979
Data da Alteração: 07/11/2017
Responsável......: Edilaine
Descrição........: Reestruturação da tela do elegível
--------------------------------------------------------------------------------------------------
Pendência   : SOL 148773 KINTANA 1063150
Responsável : Fanuel Junior
Descrição   : Alterado a funcionalidade de Histórico de Moléstia Grave" para que seja possível
              alterar e/ou excluir registros indevidos
--------------------------------------------------------------------------------------------------
Pendência   : SOL 128874 KINTANA 695343
Responsável : Fanuel Junior
Data        : 19/10/2010
Descrição   : Criação do formulario Historico de Molestia Grave
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ImgList, Wwdatsrc,
  TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker,
  CMDateTimePicker, UMensErro, DBClient, uCMClientDataSet, DBaseDados;

type
  TOperacao = (opDelete, opUpdate, opInsert);  //edilaine - SIG33979

  TfrmHistMolestiaGrave = class(TfrmSairAjuda)
    dsHistMolestiaGrave: TwwDataSource;
    ImlPadrao: TImageList;
    Dock973: TDock97;
    qryHistMolestiaGrave: TwwQuery;
    qryPessoaFisicaMolestia: TwwQuery;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    updHistMolestiaGrave: TUpdateSQL;
    updqryPessoaFisicaMolestia: TUpdateSQL;
    dockBotoes: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    pnlDados: TPanel;
    dbgrHistorico: TDBGrid;
    pnlControlesDet: TPanel;
    Label22: TLabel;
    Label45: TLabel;
    dbdtIniMolestia: TCMDateTimePicker;
    dbdtFimMolestia: TCMDateTimePicker;
    qryPeriodo: TwwQuery;
    updPeriodo: TUpdateSQL;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //procedure dbgrHistoricoKeyPress(Sender: TObject; var Key: Char);     //edilaine - SIG33979 
    function  VerificaDataAtual(DtInicio, DtFim : TDateTime) : boolean;
    procedure qryHistMolestiaGraveBeforeDelete(DataSet: TDataSet);
    procedure AtualizaDataPessoaFisica();
    procedure qryHistMolestiaGraveBeforeEdit(DataSet: TDataSet);
    procedure qryHistMolestiaGraveBeforePost(DataSet: TDataSet);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FIdpessoa :Integer;
    procedure exibirQueryHistorico;
    function TemMolestiaNoPeriodo : Boolean;                               //edilaine - SIG33979
    function TemPeriodoAberto(iFatorComparacao : byte) : boolean;          //edilaine - SIG33979
    { Private declarations }
  public

    property IdPessoa : Integer read FIdPessoa;
    constructor Create(AOwner: TComponent; AIdPessoa : Integer; dtDatainicioMolestia, dtDataFimMolestia : TDateTime); overload;
    //constructor Create(AOwner: TComponent; AIdPessoa : Integer; Controle: boolean); overload;      //edilaine - SIG33979
    constructor Create(AOwner: TComponent; AIdPessoa : Integer; Controle: boolean); overload; //Taffarel - SIG63063
    { Public declarations }
  end;


var
  frmHistMolestiaGrave : TfrmHistMolestiaGrave;
  dtInicioMolestia, dtFimMolestia : TDateTime;
  bDtAtual,bAlteracoes  : boolean;
  Operacao  : TOperacao;
  qryPessoa : TwwQuery;
  Alterar : boolean; //Taffarel - SIG63063

implementation

{$R *.DFM}

//edilaine - SIG33979 - inicio
//constructor TfrmHistMolestiaGrave.Create(AOwner: TComponent; AIdPessoa: Integer);
constructor TfrmHistMolestiaGrave.Create(AOwner: TComponent; AIdPessoa: Integer; Controle: boolean); //Taffarel - SIG63063
begin
   inherited Create(AOwner);
   bAlteracoes := false;
   FIdPessoa := AIdPessoa;
   bDtAtual := false;
   //Taffarel - SIG63063 - início
   Alterar := Controle;

   if not(Alterar) then
   begin
      sbtnInsDet.Enabled := False;
   end;
   //Taffarel - SIG63063 - fim
   exibirQueryHistorico;
   dbgrHistorico.BringToFront;

//   if not() then

end;
//edilaine - SIG33979 - fim

constructor TfrmHistMolestiaGrave.Create(AOwner: TComponent;
  AIdPessoa: Integer; dtDatainicioMolestia, dtDataFimMolestia : TDateTime);
   begin
      inherited Create(AOwner);
      bAlteracoes := false;
      FIdPessoa := AIdPessoa;
      exibirQueryHistorico;
      dtInicioMolestia :=  dtDatainicioMolestia;
      dtFimMolestia    :=  dtDataFimMolestia;
      bDtAtual := false;
      //qryPessoa := TwwQuery.Create(Nil);
      //qryPessoa.DataBaseName := 'BaseDados';
   end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.exibirQueryHistorico;
   begin
      qryHistMolestiaGrave.Close;
      qryHistMolestiaGrave.ParamByName('IdPessoa').AsInteger := FIdPessoa;
      qryHistMolestiaGrave.Open;
      //edilaine - SIG33979 - inicio
      //sbtnAltDet.Enabled := not qryHistMolestiaGrave.IsEmpty;
      //Taffarel - SIG63063 - início
      if not qryHistMolestiaGrave.IsEmpty and Alterar then
      begin
        sbtnAltDet.Enabled := True;
      end
      else
        begin
        sbtnAltDet.Enabled := False;
        end;
      //Taffarel - SIG63063 - fim
      //qryHistMolestiaGrave.FieldByName('DTINICIO').EditMask := '##/##/####';
      //qryHistM=olestiaGrave.FieldByName('DTFINAL').EditMask  := '##/##/####';

      {qryPessoaFisicaMolestia.Close;
      qryPessoaFisicaMolestia.ParamByName('IDPESSOA').AsInteger := FIdPessoa;
      qryPessoaFisicaMolestia.Open; }
      //edilaine - SIG33979 - fim
   end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  //edilaine - SIG33979 - inicio
  if TemPeriodoAberto(2) then
  begin
    MsgDlg('Histórico inconsistente. Ajuste.','Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;
   //edilaine - SIG33979 - fim

  //DBGrid1.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];   //edilaine - SIG33979
  dockBotoes.Visible := True;
  pnlControlesDet.BringToFront;
  Dock971.Visible := false;

  //edilaine - SIG33979 - inicio
  qryHistMolestiaGrave.insert;  //.edit;
  qryHistMolestiaGrave.FieldByName('IDPESSOA').AsInteger := FIdPessoa;
  Operacao := opInsert; // opUpdate;
  dbdtIniMolestia.setfocus;
  {VerificaDataAtual(qryHistMolestiaGrave.FieldByName('DTINICIO').AsDateTime,
                    qryHistMolestiaGrave.FieldByName('DTFINAL').AsDateTime); }
  //edilaine - SIG33979 - fim
end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Deseja excluir o registro selecionado ?', mtConfirmation,[mbYes, mbNo],0) = mrYes  then
  begin
     qryHistMolestiaGrave.Delete;

     //edilaine - SIG33979 - inicio
     qryHistMolestiaGrave.ApplyUpdates;
     exibirQueryHistorico;

     {if  bDtAtual then
     begin
       Operacao := opDelete ;
       AtualizaDataPessoaFisica();
     end; }
     //edilaine - SIG33979 - fim

  end;
  sbtnAltDet.Down := false;
end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   qryHistMolestiaGrave.ApplyUpdates;
   //qryPessoaFisicaMolestia.ApplyUpdates;    //edilaine - SIG33979
//   commit;
   bAlteracoes := true;
end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;
  qryHistMolestiaGrave.CancelUpdates;
  //edilaine - SIG33979 - inicio
  qryPeriodo.Close;
  qryPeriodo.SQL.Text := 'rollback to HSTMOLESTIA';
  qryPeriodo.ExecSQL;
  //qryPessoaFisicaMolestia.CancelUpdates;
  //edilaine - SIG33979 - fim
end;

{//edilaine - SIG33979 - inicio
//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.dbgrHistoricoKeyPress(Sender: TObject;var Key: Char);
var
dDatafim, dDataInicio : TDateTime;
begin
  inherited;

     if (qryHistMolestiaGrave.FieldByName('DTFINAL').AsDateTime > qryHistMolestiaGrave.FieldByName('DTINICIO').AsDateTime) or
        (qryHistMolestiaGrave.FieldByName('DTFINAL').AsDateTime = 0) then begin
        DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
        AtualizaDataPessoaFisica;
     end
     else
        qryHistMolestiaGrave.Cancel;
        sbtnInsDet.Down := false;
end;
}//edilaine - SIG33979 - fim

//Fanuel Junior SOL 148773 KINTANA 1063150
function TfrmHistMolestiaGrave.VerificaDataAtual(DtInicio, DtFim : TDateTime) : boolean;
var
  DtInicioQry, DtFimQry : TDateTime;
  qryAux : TwwQuery;
begin
   qryPessoaFisicaMolestia.Close;
   qryPessoaFisicaMolestia.ParamByName('IDPESSOA').AsInteger := FIdPessoa;
   qryPessoaFisicaMolestia.Open;

    DtInicioQry := qryPessoaFisicaMolestia.FieldByName('DATAMOLESTIAGRAVE').AsDateTime;
    DtFimQry    := qryPessoaFisicaMolestia.FieldByName('DATAFIMMOLESTIA').AsDateTime;

    if  (DtInicioQry = DtInicio) and (DtFimQry = DtFim) then
        bDtAtual := true
    else
        bDtAtual := false;
end;


//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.qryHistMolestiaGraveBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  //edilaine - SIG33979 - inicii
  {  VerificaDataAtual(qryHistMolestiaGrave.FieldByName('DTINICIO').AsDateTime,
         qryHistMolestiaGrave.FieldByName('DTFINAL').AsDateTime);
  }//edilaine - SIG33979 - fim
end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.AtualizaDataPessoaFisica();
begin

if bDtAtual then begin

    if (Operacao = opDelete) then begin
      qryPessoaFisicaMolestia.Delete;

    end
    else begin
     qryPessoaFisicaMolestia.Edit;
     qryPessoaFisicaMolestia.FieldByName('DATAMOLESTIAGRAVE').AsDateTime :=  qryHistMolestiaGrave.FieldByName('DTINICIO').AsDateTime;
     qryPessoaFisicaMolestia.FieldByName('DATAFIMMOLESTIA').AsDateTime :=  qryHistMolestiaGrave.FieldByName('DTFINAL').AsDateTime;
     qryPessoaFisicaMolestia.Post;

    end;
    qryPessoaFisicaMolestia.ApplyUpdates;

 end;
end;

procedure TfrmHistMolestiaGrave.qryHistMolestiaGraveBeforeEdit(DataSet: TDataSet);
begin
  inherited;
// MessageDlg('Custom dialog',mtCustom,[mbYes,mbAll,mbCancel], 0);
end;

//Fanuel Junior SOL 148773 KINTANA 1063150
procedure TfrmHistMolestiaGrave.qryHistMolestiaGraveBeforePost(DataSet: TDataSet);
begin
  inherited;
  //edilaine - SIG33979 - inicio
  {if Operacao = opUpdate then begin
     AtualizaDataPessoaFisica();
  end;
  }//edilaine - SIG33979 - fim
end;

//Fanuel Junior SOL 148773 KINTANA 1063150


procedure TfrmHistMolestiaGrave.bbtnSairClick(Sender: TObject);
begin
  qryHistMolestiaGrave.CancelUpdates;
  //qryPessoaFisicaMolestia.CancelUpdates;    //edilaine - SIG33979
  inherited;

end;


//edilaine - SIG33979 - inicio
procedure TfrmHistMolestiaGrave.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if dbdtIniMolestia.Date = 0 then
  begin
    MsgDlg('A Data Início da Moléstia é obrigatória.','Informação',mtInformation,[mbOk,mbHelp],0);
    dbdtIniMolestia.SetFocus;
    Exit;

  end;

  if (dbdtFimMolestia.Date <> 0) and (dbdtFimMolestia.Date < dbdtIniMolestia.Date)  then
  begin
    MsgDlg('A Data Término da Moléstia Grave tem que ser maior que a Data Início.','Informação',mtInformation,[mbOk,mbHelp],0);
    dbdtFimMolestia.SetFocus;
    Exit;
  end;

  if TemMolestiaNoPeriodo() then
  begin
    MsgDlg('O período informado da Moléstia Grave está em desacordo com um período já cadastrado.','Informação',mtInformation,[mbOk,mbHelp],0);
    dbdtFimMolestia.SetFocus;
    Exit;
  end;

  //edilaine - SIG33979 - inicio
  if (dbdtFimMolestia.Text = '') and (TemPeriodoAberto(1)) then
  begin
    MsgDlg('Histórico inconsistente.'+char(13)+char(10)+'Já existe um período aberto. Ajuste.','Informação',mtInformation,[mbOk,mbHelp],0);
    dbdtFimMolestia.SetFocus;
    Exit;
  end;
   //edilaine - SIG33979 - fim

  qryHistMolestiaGrave.Post;
  qryHistMolestiaGrave.ApplyUpdates;
  exibirQueryHistorico;

  sbtnInsDet.Down    := false;
  dockBotoes.Visible := false;
  Dock971.Visible    := true;
  pnlControlesDet.SendToBack;
end;

function TfrmHistMolestiaGrave.TemMolestiaNoPeriodo: Boolean;
begin
  qryPeriodo.Close;
  qryPeriodo.SQL.Text := 'SELECT 1 FROM HSTMOLESTIAGRAVE '+
                         ' WHERE IDPESSOA = '+IntToStr(FIdPessoa)+
                         '   AND (TO_DATE('+Quotedstr(dbdtIniMolestia.text)+', ''DD/MM/YYYY'') BETWEEN DTINICIO AND NVL(DTFINAL, SYSDATE)'+
                         '    OR  TO_DATE('+Quotedstr(dbdtFimMolestia.text)+', ''DD/MM/YYYY'') BETWEEN DTINICIO AND NVL(DTFINAL, SYSDATE))';
  qryPeriodo.Open;

  Result := not qryPeriodo.eof;
end;

procedure TfrmHistMolestiaGrave.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if qryHistMolestiaGrave.State in [dsedit, dsinsert] then
     qryHistMolestiaGrave.Cancel;

  sbtnInsDet.Down    := false;
  dockBotoes.Visible := false;
  Dock971.Visible    := true;
  pnlControlesDet.SendToBack;
end;

procedure TfrmHistMolestiaGrave.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if qryHistMolestiaGrave.State in [dsedit, dsinsert] then
     qryHistMolestiaGrave.Cancel;

  sbtnInsDet.Down    := false;
  dockBotoes.Visible := false;
  Dock971.Visible    := true;
  pnlControlesDet.SendToBack;
end;

procedure TfrmHistMolestiaGrave.FormShow(Sender: TObject);
begin
  inherited;
  //criando um SavePoint
  qryPeriodo.Close;
  qryPeriodo.SQL.Text := 'savepoint HSTMOLESTIA';
  qryPeriodo.ExecSQL;
end;

function TfrmHistMolestiaGrave.TemPeriodoAberto(iFatorComparacao : byte): boolean;
begin
  qryPeriodo.Close;
  qryPeriodo.SQL.Text := 'SELECT COUNT(*) AS QTD  '+
                         '  FROM HSTMOLESTIAGRAVE '+
                         ' WHERE IDPESSOA = '+IntToStr(FIdPessoa)+
                         '   AND DTFINAL IS NULL';
  qryPeriodo.Open;

  Result := qryPeriodo.Fields[0].AsInteger >= iFatorComparacao;

end;
//edilaine - SIG33979 - fim

end.
