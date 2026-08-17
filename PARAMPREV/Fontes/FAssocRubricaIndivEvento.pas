unit FAssocRubricaIndivEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, MontaSelect;

type
  TfrmAssocRubricaIndivEvento = class(TfrmSairAjuda)
    Panel4: TPanel;
    lbPatro: TLabel;
    dsPlanPrev: TwwDataSource;
    dsRubricaIndivEvento: TwwDataSource;
    qryRubricaIndivEvento: TwwQuery;
    qryPlanPrev: TwwQuery;
    qryAux: TwwQuery;
    dbgrdPlanos: TDBGrid;
    Panel5: TPanel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    dbgrdEventos: TDBGrid;
    Label1: TLabel;
    dsEventoGerador: TwwDataSource;
    qryEventoGerador: TwwQuery;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    Label10: TLabel;
    btnProcProv: TBitBtn;
    dbgrdPlanPatro: TwwDBGrid;
    btnProcRXP: TBitBtn;
    lblPlanPatro: TLabel;
    MontaSqlRXP: TMontaSelect;
    MontaSqlProv: TMontaSelect;
    qryProv: TwwQuery;
    dsProv: TwwDataSource;
    dbgProvDesc: TwwDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure AtualizaGrids;
    procedure qryPlanPrevAfterScroll(DataSet: TDataSet);
    procedure dblkplistContribNaoAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdContribAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistContribNaoAssocDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure dblkplistContribNaoAssocDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdContribAssocDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure dbgrdContribAssocDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
    procedure qryEventoGeradorAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure btnProcRXPClick(Sender: TObject);
    procedure btnProcProvClick(Sender: TObject);
    procedure dbgProvDescDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgProvDescDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgProvDescMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgrdPlanPatroDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dbgrdPlanPatroDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocRubricaIndivEvento: TfrmAssocRubricaIndivEvento;

implementation

uses
    UMensErro, UAdmPrev, FLerRegraRubricaIndivEvento  ;

{$R *.DFM}

procedure TfrmAssocRubricaIndivEvento.FormActivate(Sender: TObject);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPlanPrev.Open;

  qryEventoGerador.Close;
  qryEventoGerador.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryEventoGerador.Open;


  qryRubricaIndivEvento.Close;
  qryRubricaIndivEvento.ParamByName('IdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryRubricaIndivEvento.ParamByName('IdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryRubricaIndivEvento.Open;


  qryprov.Close;
  qryprov.ParamByName('IdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryprov.ParamByName('IdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryprov.Open;

end;

procedure TfrmAssocRubricaIndivEvento.FormShow(Sender: TObject);
begin
  inherited;
  frmLerRegraRubricaIndivEvento.bAlteraRegra := False;
end;

procedure TfrmAssocRubricaIndivEvento.sbtnAssociaClick(Sender: TObject);
begin
  inherited;

  if qryprov.isempty then exit;

  with frmLerRegraRubricaIndivEvento do
  begin
      bAlteraRegra := False;
      lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
      lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
      lblrubrica.Caption := 'Rubrica ' + qryprov.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         exit;
  end;


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO RUBRICAINDIVEVENTO (IDPLANOPREV, IDEVENTOGERADOR, IDRUBRICA, IDREGRAVALIDAASS, IDREGRACALCULO) '+
                 ' VALUES(' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                              qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ',' +
                              qryprov.FieldByName('IDRUBRICA').AsString + ',' +
                              frmLerRegraRubricaIndivEvento.sRegraValidaAssoc + ','+
                              frmLerRegraRubricaIndivEvento.sRegraCalculo + ')');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;

  if qryprov.isempty then exit;
  
  qryprov.First;
  while not qryprov.EOF do
      begin
           with frmLerRegraRubricaIndivEvento do
           begin
                bAlteraRegra := False;
                lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
                lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
                lblrubrica.Caption := 'Rubrica ' + qryprov.FieldByName('NOME').AsString;
                ShowModal;
                if bBotaoOk = False then
                   exit;
           end;


           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' INSERT INTO RUBRICAINDIVEVENTO (IDPLANOPREV, IDEVENTOGERADOR, IDRUBRICA, IDREGRAVALIDAASS, IDREGRACALCULO) '+
                          ' VALUES(' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                                       qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ',' +
                                       qryprov.FieldByName('IDCONTRIBUICAO').AsString + ',' +
                                       frmLerRegraRubricaIndivEvento.sRegraValidaAssoc + ','+
                                       frmLerRegraRubricaIndivEvento.sRegraCalculo + ')');
           try
              qryAux.ExecSQL;
           except
              on E:EDBEngineError do
                 begin
                      MostrarErro(E);
                      Exit;
                 end;
           end;

           qryprov.Next;
      end;

  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;

  if qryRubricaIndivEvento.isempty then exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM RUBRICAINDIVEVENTO   ' +
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ' AND ' +
                 '       IDRUBRICA  = ' + qryRubricaIndivEvento.FieldByName('IDRUBRICA').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;

  if qryRubricaIndivEvento.isempty then exit;
  
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM RUBRICAINDIVEVENTO  ' +
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.qryPlanPrevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.qryEventoGeradorAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.AtualizaGrids;
begin
  if (qryPlanPrev.State in [dsInactive]) or (qryEventoGerador.State in [dsInactive]) then
      exit;

  qryRubricaIndivEvento.Close;
  qryRubricaIndivEvento.ParamByName('IdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryRubricaIndivEvento.ParamByName('IdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryRubricaIndivEvento.Open;

  qryprov.Close;
  qryprov.ParamByName('IdPlanoPrev').AsString     := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  qryprov.ParamByName('IdEventoGerador').AsString := qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString;
  qryprov.Open;

end;

procedure TfrmAssocRubricaIndivEvento.dblkplistContribNaoAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox then
     TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdContribAssocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocRubricaIndivEvento.dblkplistContribNaoAssocDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocRubricaIndivEvento.dblkplistContribNaoAssocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if (not qryRubricaIndivEvento.Active) or (not qryprov.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdContribAssocDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdContribAssocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if (not qryRubricaIndivEvento.Active) or (not qryprov.Active) then Exit;

  if (Source is TDBLookUpListBox)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocRubricaIndivEvento.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  if qryRubricaIndivEvento.isempty then exit;

  with frmLerRegraRubricaIndivEvento do
  begin
      bAlteraRegra := True;
      lblPlano.Caption        := 'Plano '  + qryPlanPrev.FieldByName('NOME').AsString;
      lblEvento.Caption       := 'Evento ' + qryEventoGerador.FieldByName('NOME').AsString;
      lblrubrica.Caption := 'Rubrica ' + qryRubricaIndivEvento.FieldByName('NOME').AsString;
      ShowModal;
      if bBotaoOk = False then
         exit;
  end;


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE RUBRICAINDIVEVENTO  SET IDREGRAVALIDAASS = ' + frmLerRegraRubricaIndivEvento.sRegraValidaAssoc +
                 ' ,IDREGRACALCULO = '+frmLerRegraRubricaIndivEvento.sRegraCalculo+' '+
                 ' WHERE IDPLANOPREV     = ' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString          + ' AND ' +
                 '       IDEVENTOGERADOR = ' + qryEventoGerador.FieldByName('IDEVENTOGERADOR').AsString + ' AND ' +
                 '       IDRUBRICA  = ' + qryRubricaIndivEvento.FieldByName('IDRUBRICA').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  AtualizaGrids;
end;

procedure TfrmAssocRubricaIndivEvento.btnProcRXPClick(Sender: TObject);
begin
  inherited;
  MontaSqlRXP.Filtro.Clear;
  MontaSqlRXP.Filtro.Add(' RB.IDRUBRICA = PP.IDPROVENTO ');
  MontaSqlRXP.Filtro.Add(' RB.IDPLANOPREV   = '+qryplanprev.FieldbyName('IdPlanoPrev').AsString+'');
  MontaSqlRXP.Filtro.Add(' RB.IDEVENTOGERADOR = '+qryEventoGerador.fieldbyname('IdEventoGerador').AsString+' ');
  MontaSqlRXP.Executar;

  if (MontaSqlRXP.ValoresChave.Count > 0) and (MontaSqlRXP.ValoresChave[0] <> '') then
      begin
         
         if not qryRubricaIndivEvento.Locate('IDRUBRICA',MontaSqlRXP.ValoresChave[0],[loCaseInsensitive, loPartialKey])
         then ShowMessage('Rubrica não encontrada.');
      end;
end;

procedure TfrmAssocRubricaIndivEvento.btnProcProvClick(Sender: TObject);
begin
  inherited;

  MontaSqlProv.Filtro.Clear;
  MontaSqlProv.Filtro.Add(' NOT EXISTS(SELECT RB.IDRUBRICA  FROM   RUBRICAINDIVEVENTO RB  WHERE '+
                         ' RB.IDPLANOPREV   = '+qryplanprev.FieldbyName('IdPlanoPrev').AsString+
                         ' AND RB.IDEVENTOGERADOR = '+qryEventoGerador.fieldbyname('IdEventoGerador').AsString+' )  ');
  MontaSqlProv.Executar;

  if (MontaSqlProv.ValoresChave.Count > 0) and (MontaSqlProv.ValoresChave[0] <> '') then
      begin
         
         if not qryProv.Locate('IDRUBRICA',MontaSqlProv.ValoresChave[0],[loCaseInsensitive, loPartialKey])
         then ShowMessage('Rubrica não encontrada.');
      end;
end;

procedure TfrmAssocRubricaIndivEvento.dbgProvDescDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocRubricaIndivEvento.dbgProvDescDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  
  Accept := False;

  if (not qryProv.Active) or (not qryRubricaIndivEvento.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     
     Accept := True;
end;

procedure TfrmAssocRubricaIndivEvento.dbgProvDescMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TwwDBGrid
  then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdPlanPatroDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdPlanPatroDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = grid
    Source = list ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryRubricaIndivEvento.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocRubricaIndivEvento.dbgrdPlanPatroMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocRubricaIndivEvento.FormCreate(Sender: TObject);
begin
  inherited;
  frmLerRegraRubricaIndivEvento := TfrmLerRegraRubricaIndivEvento.create(application);

end;

procedure TfrmAssocRubricaIndivEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLerRegraRubricaIndivEvento.free;
end;

end.
