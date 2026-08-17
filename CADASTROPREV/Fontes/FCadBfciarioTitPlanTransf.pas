unit FCadBfciarioTitPlanTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, Db, DBTables, Wwquery, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti;

type
  TFrmCadBfciarioTitPlanTransf = class(TfrmSairAjuda)
    pnldest: TPanel;
    pnlorig: TPanel;
    Panel3: TPanel;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblpart: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblpartdest: TLabel;
    lblpatrodest: TLabel;
    lblplanodest: TLabel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter3: TSplitter;
    Panel8: TPanel;
    Splitter4: TSplitter;
    Panel9: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid4: TwwDBGrid;
    qrybeneforig: TwwQuery;
    qrybenefdest: TwwQuery;
    qrybeneficiarioorig: TwwQuery;
    qrybeneficiariodest: TwwQuery;
    qryaux: TwwQuery;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    dsbeneforig: TwwDataSource;
    dsbeneficiarioorig: TwwDataSource;
    dsbenefdest: TwwDataSource;
    dsbeneficiariodest: TwwDataSource;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure qrybeneforigBeforeOpen(DataSet: TDataSet);
    procedure qrybenefdestBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure qrybeneficiarioorigBeforeOpen(DataSet: TDataSet);
    procedure qrybeneficiariodestBeforeOpen(DataSet: TDataSet);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure qrybeneforigAfterScroll(DataSet: TDataSet);
    procedure qrybenefdestAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure wwDBGrid4DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBGrid3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBGrid4DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGrid3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwDBGrid4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
  procedure AtualizaGrids;
    { Public declarations }
  end;

var
  FrmCadBfciarioTitPlanTransf: TFrmCadBfciarioTitPlanTransf;

implementation

uses FEventoTransfPlano, umenserro, udatabase;


{$R *.DFM}

procedure TFrmCadBfciarioTitPlanTransf.AtualizaGrids;
begin
   qrybeneficiarioorig.close;
   qrybeneficiariodest.close;
   qrybeneficiarioorig.open;
   qrybeneficiariodest.open;
end;

procedure TFrmCadBfciarioTitPlanTransf.qrybeneforigBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
   qrybeneforig.parambyname('idplanoprev').AsString := sIdPlanoOrigem;
end;

procedure TFrmCadBfciarioTitPlanTransf.qrybenefdestBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
   qrybenefdest.parambyname('idplanoprev').AsString := sIdPlanoDestino;
end;

procedure TFrmCadBfciarioTitPlanTransf.FormActivate(Sender: TObject);
begin
  inherited;

   lblpatrodest.Caption := sNomePatroTransf;
   lblplanodest.Caption := sNomePlanoOrigem;
   qrybeneforig.close;
   qrybenefdest.close;
   qrybenefdest.open;
   qrybeneforig.open;

   AtualizaGrids;
end;

procedure TFrmCadBfciarioTitPlanTransf.qrybeneficiarioorigBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
   qrybeneficiarioorig.parambyname('idtitular').AsString := sIdPessoaTransf;
   qrybeneficiarioorig.parambyname('idplanoprev').AsString := sIdPlanoOrigem;
   qrybeneficiarioorig.parambyname('idpessjur').AsString := sIdPessJurTransf;
   qrybeneficiarioorig.parambyname('seqproposta').AsString := sSeqPropostaTransf;
   qrybeneficiarioorig.parambyname('idbeneficio').AsString := qrybeneforig.fieldbyname('idbeneficio').AsString;
   qrybeneficiarioorig.parambyname('idplanoprevdest').AsString := sIdPlanoDestino;
   qrybeneficiarioorig.parambyname('idpessjurdest').AsString := sIdPessJurDestinoTransf;
   qrybeneficiarioorig.parambyname('idbeneficiodest').AsString := qrybenefdest.fieldbyname('idbeneficio').AsString;
end;

procedure TFrmCadBfciarioTitPlanTransf.qrybeneficiariodestBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
   qrybeneficiariodest.parambyname('idtitular').AsString := sIdPessoaTransf;
   qrybeneficiariodest.parambyname('idplanoprev').AsString := sIdPlanoDestino;
   qrybeneficiariodest.parambyname('idpessjur').AsString := sIdPessJurDestinoTransf;
   qrybeneficiariodest.parambyname('seqproposta').AsString := sSeqPropostaTransf;
   qrybeneficiariodest.parambyname('idbeneficio').AsString := qrybenefdest.fieldbyname('idbeneficio').AsString;
end;

procedure TFrmCadBfciarioTitPlanTransf.sbtnDesassociaClick(
  Sender: TObject);
begin
  inherited;
   if qrybeneficiarioorig.isempty then exit;
   qryaux.close;
   qryaux.sql.clear;
   
   qryaux.sql.add(' INSERT INTO BFCIARIOTITPLAN(IDPESSJUR,IDTITULAR,IDPLANOPREV, IDPLANOORIGEM,'+
                  ' SEQPROPOSTA, IDPESSOA, IDBENEFICIO, IDDEPENRESPON , IDRESPONSAVEL) '+
                  ' VALUES('+sIdPessJurTransf+','+sIdPessoaTransf+','+sIdPlanoDestino+','+sIdPlanoDestino+','+sSeqPropostaTransf+','+
                  ' '+qrybeneficiarioorig.fieldbyname('idpessoa').AsString+','+
                  ' '+qrybenefdest.fieldbyname('idbeneficio').AsString+','+
                  ' '''+qrybeneficiarioorig.fieldbyname('iddepenrespon').AsString+''','+
                  ' '''+qrybeneficiarioorig.fieldbyname('idresponsavel').AsString+''')');
   try
      qryaux.execsql;
   except
      MsgDlg('Não foi possível inserir o beneficiário.','Erro',mtError,[mbOk],0);
      exit;
   end;

   AtualizaGrids;
end;

procedure TFrmCadBfciarioTitPlanTransf.sbtnDesassociaTodosClick(
  Sender: TObject);
begin
  inherited;

  if qrybeneficiarioorig.isempty then exit;
  qrybeneficiarioorig.first;
  while not qrybeneficiarioorig.eof do
  begin
     qryaux.close;
     qryaux.sql.clear;
     
     qryaux.sql.add(' INSERT INTO BFCIARIOTITPLAN(IDPESSJUR,IDTITULAR,IDPLANOPREV,IDPLANOORIGEM'+
                    ' SEQPROPOSTA, IDPESSOA, IDBENEFICIO, IDDEPENRESPON , IDRESPONSAVEL) '+
                    ' VALUES('+sIdPessJurTransf+','+sIdPessoaTransf+','+sIdPlanoDestino+','+sIdPlanoDestino+','+sSeqPropostaTransf+','+
                    ' '+qrybeneficiarioorig.fieldbyname('idpessoa').AsString+','+
                    ' '+qrybenefdest.fieldbyname('idbeneficio').AsString+','+
                    ' '''+qrybeneficiarioorig.fieldbyname('iddepenrespon').AsString+''','+
                    ' '''+qrybeneficiarioorig.fieldbyname('idresponsavel').AsString+''')');
     try
        qryaux.execsql;
     except
     end;

     qrybeneficiarioorig.next;
  end;

  AtualizaGrids;

  if not qrybeneficiarioorig.isempty then
  begin
     MsgDlg('Não foi possível inserir todos os beneficiários.','Erro',mtError,[mbOk],0);
     exit;
  end;

end;

procedure TFrmCadBfciarioTitPlanTransf.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  if qrybeneficiariodest.isempty then exit;
  qryaux.close;
  qryaux.sql.clear;
  
  qryaux.sql.add(' DELETE  FROM BFCIARIOTITPLAN '+
                 ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                 ' IDTITULAR = '+sIdPessoaTransf+' AND '+
                 ' IDPLANOORIGEM = '+sIdPlanoDestino+' AND '+
                 ' SEQPROPOSTA = '+sSeqPropostaTransf+' AND '+
                 ' IDPESSOA = '+qrybeneficiariodest.fieldbyname('idpessoa').AsString+' AND '+
                 ' IDBENEFICIO = '+qrybeneficiariodest.fieldbyname('idbeneficio').AsString+'');
  try
      qryaux.execsql;
   except
      MsgDlg('Não foi possível a exclusão do beneficiário.','Erro',mtError,[mbOk],0);
      exit;
   end;
   
   AtualizaGrids;
end;

procedure TFrmCadBfciarioTitPlanTransf.sbtnAssociaTodosClick(
  Sender: TObject);
begin
  inherited;

  if qrybeneficiariodest.isempty then exit;

  qrybeneficiariodest.first;
  while not qrybeneficiariodest.eof do
  begin
     qryaux.close;
     qryaux.sql.clear;
     
     qryaux.sql.add(' DELETE  FROM BFCIARIOTITPLAN '+
                    ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                    ' IDTITULAR = '+sIdPessoaTransf+' AND '+
                    ' IDPLANOORIGEM = '+sIdPlanoDestino+' AND '+
                    ' SEQPROPOSTA = '+sSeqPropostaTransf+' AND '+
                    ' IDPESSOA = '+qrybeneficiariodest.fieldbyname('idpessoa').AsString+' AND '+
                    ' IDBENEFICIO = '+qrybeneficiariodest.fieldbyname('idbeneficio').AsString+'');
     try
         qryaux.execsql;
      except
      end;
      qrybeneficiariodest.next;
   end;

   AtualizaGrids;

   if not qrybeneficiarioorig.isempty then
   begin
      MsgDlg('Não foi possível deletar todos os beneficiários.','Erro',mtError,[mbOk],0);
      exit;
   end;

end;

procedure TFrmCadBfciarioTitPlanTransf.qrybeneforigAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (qrybeneforig.active) and (qrybenefdest.active) then   AtualizaGrids;
end;

procedure TFrmCadBfciarioTitPlanTransf.qrybenefdestAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (qrybeneforig.active) and (qrybenefdest.active) then   AtualizaGrids;
end;

procedure TFrmCadBfciarioTitPlanTransf.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if MsgDlg('Esta opção irá desfazer todas as modificações feitas nos beneficiários. Deseja continuar ?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrno then
  begin
     exit;
  end;

  //delete todos os beneficiários do plano novo
  qryaux.close;
  qryaux.sql.clear;
  
  qryaux.sql.add(' DELETE  FROM BFCIARIOTITPLAN '+
                 ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                 ' IDTITULAR = '+sIdPessoaTransf+' AND '+
                 ' IDPLANOORIGEM = '+sIdPlanoDestino+' AND '+
                 ' SEQPROPOSTA = '+sSeqPropostaTransf+'');
  try
      qryaux.execsql;
  except
  end;

  AtualizaGrids;

end;

procedure TFrmCadBfciarioTitPlanTransf.bbtnSairClick(Sender: TObject);
begin
bCancelaTransf := True;
if MsgDlg('Deseja gravar as modificações ?','Confirmação',mtConfirmation,[mbno, mbyes],0) = mrno then
begin
  //delete todos os beneficiários do plano novo
  qryaux.close;
  qryaux.sql.clear;
  
  qryaux.sql.add(' DELETE FROM  BFCIARIOTITPLAN '+
                 ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                 ' IDTITULAR = '+sIdPessoaTransf+' AND '+
                 ' IDPLANOORIGEM = '+sIdPlanoDestino+' AND '+
                 ' SEQPROPOSTA = '+sSeqPropostaTransf+'');
  try
      qryaux.execsql;
  except
  end;
end;
  inherited;

end;

procedure TFrmCadBfciarioTitPlanTransf.bbtnConfirmarClick(Sender: TObject);
begin

bCancelaTransf := false;
  inherited;

end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid4DragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  if qrybeneficiarioorig.isempty then exit;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnAssociaClick(self);

end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid3DragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  if qrybeneficiariodest.isempty then exit;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(self);
end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid4DragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if (Source is TwwDBGrid)
  then
  begin
     { Se o drag não vier do grid, cancelar }
     if not (twwDBGrid(Source).Name = ('wwDBGrid4')) then exit;
     Accept := True;
  end
  else      Accept := True;
end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid3DragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if (Source is twwDBGrid)
  then
  begin
     if not (twwDBGrid(Source).Name = ('wwDBGrid3')) then exit;
     { Se o drag não vier do grid, cancelar }
     Accept := True;
  end
  else      Accept := True;
end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if Sender is TwwDBGrid
   then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TFrmCadBfciarioTitPlanTransf.wwDBGrid4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if Sender is TwwDBGrid
   then TwwDBGrid(Sender).BeginDrag(True);
end;

end.
