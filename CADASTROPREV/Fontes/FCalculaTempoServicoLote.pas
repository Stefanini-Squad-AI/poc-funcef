unit FCalculaTempoServicoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Menus, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCalculaTempoServicoLote = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    qrySitPlano: TwwQuery;
    dsSitPlano: TwwDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbgrdPatroPlano: TwwDBGrid;
    dbgrdSitPlano: TwwDBGrid;
    dbgrdSitPart: TwwDBGrid;
    qrySitPart: TwwQuery;
    dsSitPart: TwwDataSource;
    pmnuPatro: TPopupMenu;
    pmnuPatroSelTudo: TMenuItem;
    pmnuPatroInvSelecao: TMenuItem;
    updPatro: TUpdateSQL;
    updSitPlano: TUpdateSQL;
    updSitPart: TUpdateSQL;
    qry: TwwQuery;
    GroupBox2: TGroupBox;
    dtProcessamento: TCMDateTimePicker;
    pmnuSitPlano: TPopupMenu;
    pmnuSitPlanoSelTudo: TMenuItem;
    pmnuSitPlanoInvSelecao: TMenuItem;
    pmnuSitPart: TPopupMenu;
    pmnuSitPartSelTudo: TMenuItem;
    pmnuSitPartInvSelecao: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure pmnuPatroSelTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure pmnuPatroInvSelecaoClick(Sender: TObject);
    procedure pmnuSitPartSelTudoClick(Sender: TObject);
    procedure pmnuSitPartInvSelecaoClick(Sender: TObject);
    procedure pmnuSitPlanoInvSelecaoClick(Sender: TObject);
    procedure pmnuSitPlanoSelTudoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculaTempoServicoLote: TfrmCalculaTempoServicoLote;

implementation

uses DBaseDados, FAguarde, USistema, UMensErro, UConsPart, DAPrev, UModulo, uAdmPrev;

{$R *.DFM}

procedure TfrmCalculaTempoServicoLote.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := Sistema.IdEmpresa;
  qryPatro.Open;

  qrySitPlano.Close;
  qrySitPlano.Open;

  qrySitPart.Close;
  qrySitPart.Open;
end;

procedure TfrmCalculaTempoServicoLote.pmnuPatroSelTudoClick(
  Sender: TObject);
begin
  inherited;
  qryPatro.First;
  while not qryPatro.Eof do
  begin
     qryPatro.Edit;
     qryPatro.FieldbyName('PROCESSA').AsInteger := 1;
     qryPatro.Post;
     qryPatro.Next;
  end;
end;

procedure TfrmCalculaTempoServicoLote.bbtnConfirmarClick(Sender: TObject);
var sPatros, sPlanos, sSitPlano, sSitPart : string;
    iAtual, iTotal : integer;
begin
  inherited;

  sPatros    := '';
  sPlanos    := '';
  sSitPlano  := '';
  sSitPart   := '';

  qryPatro.First;
  while not qryPatro.Eof do
  begin
     if qryPatro.FieldByName('PROCESSA').AsInteger = 1
     then begin
        if Trim(sPatros) = ''
        then sPatros := qryPatro.FieldByName('IDPESSOA').AsString
        else sPatros := sPatros + ','+ qryPatro.FieldByName('IDPESSOA').AsString;
     end;

     qryPatro.Next;
  end;

  qryPatro.First;
  while not qryPatro.Eof do
  begin
     if qryPatro.FieldByName('PROCESSA').AsInteger = 1
     then begin
        if Trim(sPlanos) = ''
        then sPlanos := qryPatro.FieldByName('IDPLANOPREV').AsString
        else sPlanos := sPlanos + ','+ qryPatro.FieldByName('IDPLANOPREV').AsString;
     end;

     qryPatro.Next;
  end;

  qrySitPlano.First;
  while not qrySitPlano.Eof do
  begin
     if qrySitPlano.FieldByName('PROCESSA').AsInteger = 1
     then begin
        if Trim(sSitPlano) = ''
        then sSitPlano := qrySitPlano.FieldByName('IDSITPLANOPREV').AsString
        else sSitPlano := sSitPlano + ','+ qrySitPlano.FieldByName('IDSITPLANOPREV').AsString;
     end;

     qrySitPlano.Next;
  end;

  qrySitPart.First;
  while not qrySitPart.Eof do
  begin
     if qrySitPart.FieldByName('PROCESSA').AsInteger = 1
     then begin
        if Trim(sSitPart) = ''
        then sSitPart := qrySitPart.FieldByName('IDSITPART').AsString
        else sSitPart := sSitPart + ','+ qrySitPart.FieldByName('IDSITPART').AsString;
     end;

     qrySitPart.Next;
  end;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT DISTINCT EL.MATRICULA, PP.IDPESSOA   '+
              ' FROM   ELEGPATRO EL, PARTPREVPLAN PP        '+
              ' WHERE  PP.IDPESSJUR      IN ('+sPatros+')   '+
              ' AND    PP.IDPLANOPREV    IN ('+sPlanos+')   '+
              ' AND    PP.IDSITPLANOPREV IN ('+sSitPlano+') '+
              ' AND    PP.IDSITPART      IN ('+sSitPart+')  '+
              ' AND    EL.IDPESSJUR      = PP.IDPESSJUR     '+
              ' AND    EL.IDPESSOA       = PP.IDPESSOA      ');
  frmAguarde.Mostra('Buscando participantes com filtro indicado ... ');
  qry.Open;

  if qry.IsEmpty
  then begin
     MsgDlg('Nenhum participante encontrado com o filtro indicado. Verifique.','Informação',mtInformation,[mbOK],0);
     Exit;
  end;

  dtmBaseDados.dbBaseDados.StartTransaction;

  iAtual := 0;
  iTotal := qry.RecordCount;

  while not qry.Eof do
  begin
     inc(iAtual);
     frmAguarde.Mostra('Processando '+IntToStr(iAtual)+' de '+IntToStr(iTotal)+' ... ');
     Application.ProcessMessages;
     try
        ProcessaHistContrib(dtmAPrev.qry, qry.FieldByName('IDPESSOA').AsInteger,dtProcessamento.Text);
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao processar matrícula '+qry.FieldByName('Matrícula').AsString+#13+
               'Processo Interrompido.','Erro',mtError,[mbOK],0);
        Abort;
     end;
     qry.Next;
  end;
  GravaLogTOTALPREV ('Cálculo de Tempo de Serviço em Lote - Data Base : '+dtProcessamento.Text+ '[Patros.: '+sPatros+'-Planos:'+sPlanos+'] ');

  frmAguarde.Apaga;
  dtmBaseDados.dbBaseDados.Commit;
  MsgDlg('Processo terminado com sucesso.','Informação',mtInformation,[mbOK],0);
end;

procedure TfrmCalculaTempoServicoLote.pmnuPatroInvSelecaoClick(Sender: TObject);
begin
  inherited;
  qryPatro.First;
  while not qryPatro.Eof do
  begin
     qryPatro.Edit;
     if qryPatro.FieldbyName('PROCESSA').AsInteger = 0
     then qryPatro.FieldbyName('PROCESSA').AsInteger := 1
     else qryPatro.FieldbyName('PROCESSA').AsInteger := 0;
     qryPatro.Post;
     qryPatro.Next;
  end;
end;

procedure TfrmCalculaTempoServicoLote.pmnuSitPartSelTudoClick(
  Sender: TObject);
begin
  inherited;
  qrySitPart.First;
  while not qrySitPart.Eof do
  begin
     qrySitPart.Edit;
     qrySitPart.FieldbyName('PROCESSA').AsInteger := 1;
     qrySitPart.Post;
     qrySitPart.Next;
  end;

end;

procedure TfrmCalculaTempoServicoLote.pmnuSitPartInvSelecaoClick(
  Sender: TObject);
begin
  inherited;
  qrySitPart.First;
  while not qrySitPart.Eof do
  begin
     qrySitPart.Edit;
     if qrySitPart.FieldbyName('PROCESSA').AsInteger = 0
     then qrySitPart.FieldbyName('PROCESSA').AsInteger := 1
     else qrySitPart.FieldbyName('PROCESSA').AsInteger := 0;
     qrySitPart.Post;
     qrySitPart.Next;
  end;

end;

procedure TfrmCalculaTempoServicoLote.pmnuSitPlanoInvSelecaoClick(
  Sender: TObject);
begin
  inherited;
  qrySitPlano.First;
  while not qrySitPlano.Eof do
  begin
     qrySitPlano.Edit;
     if qrySitPlano.FieldbyName('PROCESSA').AsInteger = 0
     then qrySitPlano.FieldbyName('PROCESSA').AsInteger := 1
     else qrySitPlano.FieldbyName('PROCESSA').AsInteger := 0;
     qrySitPlano.Post;
     qrySitPlano.Next;
  end;

end;

procedure TfrmCalculaTempoServicoLote.pmnuSitPlanoSelTudoClick(
  Sender: TObject);
begin
  inherited;
  qrySitPlano.First;
  while not qrySitPlano.Eof do
  begin
     qrySitPlano.Edit;
     qrySitPlano.FieldbyName('PROCESSA').AsInteger := 1;
     qrySitPlano.Post;
     qrySitPlano.Next;
  end;

end;

end.
