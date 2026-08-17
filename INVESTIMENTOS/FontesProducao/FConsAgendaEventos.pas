unit FConsAgendaEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, Gauges, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Menus, Mask,
  wwdbedit, TREdit, URegra, Spin, FPreview;

type
  TfrmConsAgendaEventos = class(TfrmOkCancelarInv)
    pgcMercados: TPageControl;
    tbsRendaVariavel: TTabSheet;
    dbgRendaVariavel: TwwDBGrid;
    btImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    tbsBMF: TTabSheet;
    dbgBMF: TwwDBGrid;
    tbsRendaFixa: TTabSheet;
    dbgRendaFixa: TwwDBGrid;
    qryRendaVariavel: TwwQuery;
    dsRendaVariavel: TwwDataSource;
    dsBMF: TwwDataSource;
    qryBMF: TwwQuery;
    qryRendaFixa: TwwQuery;
    dsRendaFixa: TwwDataSource;
    ppmRendaVariavel: TPopupMenu;
    RVFixarColuna: TMenuItem;
    RVLiberarColuna: TMenuItem;
    N1: TMenuItem;
    RVLiberaTodasColunas: TMenuItem;
    ppmBMF: TPopupMenu;
    BMFFixarColuna: TMenuItem;
    BMFLiberarColuna: TMenuItem;
    MenuItem3: TMenuItem;
    BMFLiberarTodasColunas: TMenuItem;
    ppmRendaFixa: TPopupMenu;
    RFFixarColuna: TMenuItem;
    RFLiberarColuna: TMenuItem;
    MenuItem7: TMenuItem;
    RFLiberaTodasColunas: TMenuItem;
    tbsEmprestimo: TTabSheet;
    dbgEmprestimo: TwwDBGrid;
    dsEmprestimo: TwwDataSource;
    qryEmprestimo: TwwQuery;
    qryRendaVariavelVENCIMENTO: TDateTimeField;
    qryRendaVariavelSIGLAEMISSOR: TStringField;
    qryRendaVariavelDESCTIPOOPERACAO: TStringField;
    qryRendaVariavelASSEMBLEIA: TDateTimeField;
    qryRendaVariavelPU: TFloatField;
    qryRendaVariavelPERCENTUAL: TFloatField;
    qryRendaFixaTITULO: TStringField;
    qryRendaFixaVENCIMENTO: TDateTimeField;
    qryRendaFixaPERFIL: TStringField;
    qryRendaFixaINVESTIMENTO: TStringField;
    qryRendaFixaITEM: TStringField;
    qryRendaFixaPERCFLUXO: TFloatField;
    qryRendaFixaDATAEMISSAO: TDateTimeField;
    qryRendaFixaDATAOPERACAO: TDateTimeField;
    qryBMFVENCIMENTO: TDateTimeField;
    qryBMFDESCTIPOCTINVEST: TStringField;
    qryBMFDESCINVESTIMENTO: TStringField;
    qryBMFPRECOEXERC: TFloatField;
    qryEmprestimoDATAVENCOPER: TDateTimeField;
    qryEmprestimoDESCTIPOINVEST: TStringField;
    qryEmprestimoDESCCARTINVEST: TStringField;
    qryEmprestimoDESCINVESTIMENTO: TStringField;
    qryEmprestimoDESCTIPOOPERACAO: TStringField;
    qryEmprestimoDATAOPERACAO: TDateTimeField;
    qryEmprestimoQTDOPERACAO: TFloatField;
    qryEmprestimoPUOPERACAO: TFloatField;
    qryEmprestimoVLROPERACAO: TFloatField;
    qryEmprestimoTAXAOPERACAO: TFloatField;
    qryEmprestimoVLRRESGATE: TFloatField;
    qryEmprestimoVLRJUROS: TFloatField;
    ppmEmp: TPopupMenu;
    EmpFixarColuna: TMenuItem;
    EmpLiberarColuna: TMenuItem;
    MenuItem4: TMenuItem;
    EmpLiberarTodasColunas: TMenuItem;
    Panel1: TPanel;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTPINV: TFloatField;
    qryTipoInvestTIPOINV: TStringField;
    dblTipoInv: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    spnDias: TSpinEdit;
    Label3: TLabel;
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RVFixarColunaClick(Sender: TObject);
    procedure BMFFixarColunaClick(Sender: TObject);
    procedure RFFixarColunaClick(Sender: TObject);
    procedure RVLiberarColunaClick(Sender: TObject);
    procedure BMFLiberarColunaClick(Sender: TObject);
    procedure RFLiberarColunaClick(Sender: TObject);
    procedure RVLiberaTodasColunasClick(Sender: TObject);
    procedure BMFLiberarTodasColunasClick(Sender: TObject);
    procedure RFLiberaTodasColunasClick(Sender: TObject);
    procedure ppmRendaVariavelPopup(Sender: TObject);
    procedure ppmBMFPopup(Sender: TObject);
    procedure ppmRendaFixaPopup(Sender: TObject);
    procedure ppmEmpPopup(Sender: TObject);
    procedure EmpFixarColunaClick(Sender: TObject);
    procedure EmpLiberarColunaClick(Sender: TObject);
    procedure EmpLiberarTodasColunasClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblTipoInvChange(Sender: TObject);
  private
    { Private declarations }
    bFechada: Boolean;
    procedure AbreQuery;
    procedure FechaQuery;
  public
    { Public declarations }
  end;

var
  frmConsAgendaEventos: TfrmConsAgendaEventos;

implementation

uses UBibliotecaInvest, DBaseDados, ComObj, UDataBase, UMensErro,
     UOperComum, FDmRelAgendaEventos;

{$R *.DFM}

{ TfrmConsCartGerenc }

procedure TfrmConsAgendaEventos.AbreQuery;
begin
   Case StrToInt(dblTipoInv.LookupValue) of
   0: begin
         tbsRendaVariavel.TabVisible := True;
         tbsRendaVariavel.Caption := 'Renda &Variável (' + DateToStr(pRPI.DATAULTFECH) + ')';
         OperComum.LimpaParametros(qryRendaVariavel);
         qryRendaVariavel.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECH);
         qryRendaVariavel.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         qryRendaVariavel.Open;
         dbgRendaVariavel.FixedCols := 1;
         RVLiberaTodasColunas.Enabled := False;
         RVLiberarColuna.Enabled := False;
         RVFixarColuna.Enabled := True;

         tbsRendaFixa.TabVisible := True;
         tbsRendaFixa.Caption := 'Renda &Fixa (' + DateToStr(pRPI.DATAULTFECHRF) + ')';
         OperComum.LimpaParametros(qryRendaFixa);
         qryRendaFixa.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECHRF);
         qryRendaFixa.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECHRF + spnDias.Value);
         qryRendaFixa.Open;
         dbgRendaFixa.FixedCols := 1;
         RFLiberaTodasColunas.Enabled := False;
         RFLiberarColuna.Enabled := False;
         RFFixarColuna.Enabled := True;

         tbsBMF.TabVisible := True;
         tbsBMF.Caption := '&BM&&F (' + DateToStr(pRPI.DATAULTFECHBMF) + ')';
         OperComum.LimpaParametros(qryBMF);
         qryBMF.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECHBMF);
         qryBMF.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECHBMF + spnDias.Value);
         qryBMF.Open;
         dbgBMF.FixedCols := 1;
         BMFLiberarTodasColunas.Enabled := False;
         BMFLiberarColuna.Enabled := False;
         BMFFixarColuna.Enabled := True;

         tbsEmprestimo.TabVisible := True;
         tbsEmprestimo.Caption := '&Empréstimo (' + DateToStr(pRPI.DATAULTFECH) + ')';
         OperComum.LimpaParametros(qryEmprestimo);
         qryEmprestimo.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECH);
         qryEmprestimo.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         qryEmprestimo.Open;
         dbgEmprestimo.FixedCols := 1;
         EmpLiberarTodasColunas.Enabled := False;
         EmpLiberarColuna.Enabled := False;
         EmpFixarColuna.Enabled := True;
      end;
   1: begin
         tbsRendaVariavel.TabVisible := True;
         tbsRendaVariavel.Caption := 'Renda &Variável (' + DateToStr(pRPI.DATAULTFECH) + ')';
         if dblTipoInv.LookupValue = '1' then
         begin
            tbsRendaFixa.TabVisible := False;
            tbsBMF.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;

         OperComum.LimpaParametros(qryRendaVariavel);
         qryRendaVariavel.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECH);
         qryRendaVariavel.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         qryRendaVariavel.Open;

         dbgRendaVariavel.FixedCols := 1;
         RVLiberaTodasColunas.Enabled := False;
         RVLiberarColuna.Enabled := False;
         RVFixarColuna.Enabled := True;
      end;
   2: begin
         tbsRendaFixa.TabVisible := True;
         tbsRendaFixa.Caption := 'Renda &Fixa (' + DateToStr(pRPI.DATAULTFECHRF) + ')';
         if dblTipoInv.LookupValue = '2' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsBMF.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;

         OperComum.LimpaParametros(qryRendaFixa);
         qryRendaFixa.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECHRF);
         qryRendaFixa.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECHRF + spnDias.Value);
         qryRendaFixa.Open;

         dbgRendaFixa.FixedCols := 1;
         RFLiberaTodasColunas.Enabled := False;
         RFLiberarColuna.Enabled := False;
         RFFixarColuna.Enabled := True;
      end;
   3: begin
         tbsBMF.TabVisible := True;
         tbsBMF.Caption := '&BM&&F (' + DateToStr(pRPI.DATAULTFECHBMF) + ')';
         if dblTipoInv.LookupValue = '3' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsRendaFixa.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;

         OperComum.LimpaParametros(qryBMF);
         qryBMF.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECHBMF);
         qryBMF.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECHBMF + spnDias.Value);
         qryBMF.Open;

         dbgBMF.FixedCols := 1;
         BMFLiberarTodasColunas.Enabled := False;
         BMFLiberarColuna.Enabled := False;
         BMFFixarColuna.Enabled := True;
      end;
   4: begin
         tbsEmprestimo.TabVisible := True;
         tbsEmprestimo.Caption := '&Empréstimo (' + DateToStr(pRPI.DATAULTFECH) + ')';
         if dblTipoInv.LookupValue = '4' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsRendaFixa.TabVisible := False;
            tbsBMF.TabVisible := False;
         end;

         OperComum.LimpaParametros(qryEmprestimo);
         qryEmprestimo.ParamByName('DATAI').AsString := DateToStr(pRPI.DATAULTFECH);
         qryEmprestimo.ParamByName('DATAF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         qryEmprestimo.Open;

         dbgEmprestimo.FixedCols := 1;
         EmpLiberarTodasColunas.Enabled := False;
         EmpLiberarColuna.Enabled := False;
         EmpFixarColuna.Enabled := True;
      end;
   end;

   if (qryRendaVariavel.IsEmpty) and (qryBMF.IsEmpty) and (qryRendaFixa.IsEmpty) and
      (qryEmprestimo.IsEmpty) then
      btImprimir.Enabled := False
   else begin
      btImprimir.Enabled := True;
      with dmRelAgendaEventos.qryAgendaEventos do
      begin
         Close;
         ParamByName('DATARVI').AsString := DateToStr(pRPI.DATAULTFECH);
         ParamByName('DATARVF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         ParamByName('DATARFI').AsString := DateToStr(pRPI.DATAULTFECHRF);
         ParamByName('DATARFF').AsString := DateToStr(pRPI.DATAULTFECHRF + spnDias.Value);
         ParamByName('DATABMFI').AsString := DateToStr(pRPI.DATAULTFECHBMF);
         ParamByName('DATABMFF').AsString := DateToStr(pRPI.DATAULTFECHBMF + spnDias.Value);
         ParamByName('DATAEMPI').AsString := DateToStr(pRPI.DATAULTFECH);
         ParamByName('DATAEMPF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         ParamByName('TIPOREL').AsInteger := StrToInt(dblTipoInv.LookupValue);
         Open;
      end;
      with dmRelAgendaEventos.qryAgendaEventosDet do
      begin
         Close;
         ParamByName('DATARVI').AsString := DateToStr(pRPI.DATAULTFECH);
         ParamByName('DATARVF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         ParamByName('DATARFI').AsString := DateToStr(pRPI.DATAULTFECHRF);
         ParamByName('DATARFF').AsString := DateToStr(pRPI.DATAULTFECHRF + spnDias.Value);
         ParamByName('DATABMFI').AsString := DateToStr(pRPI.DATAULTFECHBMF);
         ParamByName('DATABMFF').AsString := DateToStr(pRPI.DATAULTFECHBMF + spnDias.Value);
         ParamByName('DATAEMPI').AsString := DateToStr(pRPI.DATAULTFECH);
         ParamByName('DATAEMPF').AsString := DateToStr(pRPI.DATAULTFECH + spnDias.Value);
         ParamByName('TIPOREL').AsInteger := StrToInt(dblTipoInv.LookupValue);
         Open;
         Filter := 'TIPOREL = ' + dmRelAgendaEventos.qryAgendaEventosTIPOREL.AsString;
      end;
   end;
end;

procedure TfrmConsAgendaEventos.btImprimirClick(Sender: TObject);
begin
   inherited;
   TFrmPreview.CreateModalPreview(Application,
                                  dmRelAgendaEventos.pprAgendaEventos,
                                  dmRelAgendaEventos.pprAgendaEventos.PrinterSetup.DocumentName);
   frmConsAgendaEventos.WindowState := wsMaximized;
end;

procedure TfrmConsAgendaEventos.FormShow(Sender: TObject);
begin
  inherited;
  qryTipoInvest.Open;
  FechaQuery;
  pgcMercados.ActivePage := tbsRendaVariavel;
end;

procedure TfrmConsAgendaEventos.RVFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := dbgRendaVariavel.FixedCols + 1;
end;

procedure TfrmConsAgendaEventos.RFFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaFixa.FixedCols := dbgRendaFixa.FixedCols + 1;
end;

procedure TfrmConsAgendaEventos.BMFFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgBMF.FixedCols := dbgBMF.FixedCols + 1;
end;

procedure TfrmConsAgendaEventos.EmpFixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgEmprestimo.FixedCols := dbgEmprestimo.FixedCols + 1;
end;

procedure TfrmConsAgendaEventos.RVLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := dbgRendaVariavel.FixedCols - 1;
end;

procedure TfrmConsAgendaEventos.RFLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgRendaFixa.FixedCols := dbgRendaFixa.FixedCols - 1;
end;

procedure TfrmConsAgendaEventos.BMFLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgBMF.FixedCols := dbgBMF.FixedCols - 1;
end;

procedure TfrmConsAgendaEventos.EmpLiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgEmprestimo.FixedCols := dbgEmprestimo.FixedCols - 1;
end;

procedure TfrmConsAgendaEventos.RVLiberaTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgRendaVariavel.FixedCols := 0;
end;

procedure TfrmConsAgendaEventos.RFLiberaTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgRendaFixa.FixedCols := 0;
end;

procedure TfrmConsAgendaEventos.BMFLiberarTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgBMF.FixedCols := 0;
end;

procedure TfrmConsAgendaEventos.EmpLiberarTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgEmprestimo.FixedCols := 0;
end;

procedure TfrmConsAgendaEventos.ppmRendaVariavelPopup(Sender: TObject);
begin
  inherited;
  if dbgRendaVariavel.DataSource.DataSet.Active then
  begin
     if dbgRendaVariavel.FixedCols = 0 then begin
        RVLiberarColuna.Enabled := False;
        RVLiberaTodasColunas.Enabled := False;
        end
     else begin
        RVLiberarColuna.Enabled := True;
        RVLiberaTodasColunas.Enabled := True;
     end;

     if dbgRendaVariavel.FixedCols = dbgRendaVariavel.GetColCount then
        RVFixarColuna.Enabled := False
     else
        RVFixarColuna.Enabled := True;
  end
  else
  begin
     RVLiberarColuna.Enabled := False;
     RVLiberaTodasColunas.Enabled := False;
     RVFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsAgendaEventos.ppmRendaFixaPopup(Sender: TObject);
begin
  inherited;
  if dbgRendaFixa.DataSource.DataSet.Active then
  begin
     if dbgRendaFixa.FixedCols = 0 then begin
        RFLiberarColuna.Enabled := False;
        RFLiberaTodasColunas.Enabled := False;
        end
     else begin
        RFLiberarColuna.Enabled := True;
        RFLiberaTodasColunas.Enabled := True;
     end;

     if dbgRendaFixa.FixedCols = dbgRendaFixa.GetColCount then
        RFFixarColuna.Enabled := False
     else
        RFFixarColuna.Enabled := True;
  end
  else
  begin
     RFLiberarColuna.Enabled := False;
     RFLiberaTodasColunas.Enabled := False;
     RFFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsAgendaEventos.ppmBMFPopup(Sender: TObject);
begin
  inherited;
  if dbgBMF.DataSource.DataSet.Active then
  begin
     if dbgBMF.FixedCols = 0 then begin
        BMFLiberarColuna.Enabled := False;
        BMFLiberarTodasColunas.Enabled := False;
        end
     else begin
        BMFLiberarColuna.Enabled := True;
        BMFLiberarTodasColunas.Enabled := True;
     end;

     if dbgBMF.FixedCols = dbgBMF.GetColCount then
        BMFFixarColuna.Enabled := False
     else
        BMFFixarColuna.Enabled := True;
  end
  else
  begin
     BMFLiberarColuna.Enabled := False;
     BMFLiberarTodasColunas.Enabled := False;
     BMFFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsAgendaEventos.ppmEmpPopup(Sender: TObject);
begin
  inherited;
  if dbgEmprestimo.DataSource.DataSet.Active then
  begin
     if dbgEmprestimo.FixedCols = 0 then begin
        EmpLiberarColuna.Enabled := False;
        EmpLiberarTodasColunas.Enabled := False;
        end
     else begin
        EmpLiberarColuna.Enabled := True;
        EmpLiberarTodasColunas.Enabled := True;
     end;

     if dbgEmprestimo.FixedCols = dbgEmprestimo.GetColCount then
        EmpFixarColuna.Enabled := False
     else
        EmpFixarColuna.Enabled := True;
  end
  else
  begin
     EmpLiberarColuna.Enabled := False;
     EmpLiberarTodasColunas.Enabled := False;
     EmpFixarColuna.Enabled := False
  end;
end;

procedure TfrmConsAgendaEventos.FechaQuery;
begin
   tbsRendaVariavel.TabVisible := True;
   tbsRendaVariavel.Caption := 'Renda &Variável (' + DateToStr(pRPI.DATAULTFECH) + ')';
   OperComum.LimpaParametros(qryRendaVariavel);
   dbgRendaVariavel.FixedCols := 1;
   RVLiberaTodasColunas.Enabled := False;
   RVLiberarColuna.Enabled := False;
   RVFixarColuna.Enabled := True;

   tbsRendaFixa.TabVisible := True;
   tbsRendaFixa.Caption := 'Renda &Fixa (' + DateToStr(pRPI.DATAULTFECHRF) + ')';
   OperComum.LimpaParametros(qryRendaFixa);
   dbgRendaFixa.FixedCols := 1;
   RFLiberaTodasColunas.Enabled := False;
   RFLiberarColuna.Enabled := False;
   RFFixarColuna.Enabled := True;

   tbsBMF.TabVisible := True;
   tbsBMF.Caption := '&BM&&F (' + DateToStr(pRPI.DATAULTFECHBMF) + ')';
   OperComum.LimpaParametros(qryBMF);
   dbgBMF.FixedCols := 1;
   BMFLiberarTodasColunas.Enabled := False;
   BMFLiberarColuna.Enabled := False;
   BMFFixarColuna.Enabled := True;

   tbsEmprestimo.TabVisible := True;
   tbsEmprestimo.Caption := '&Empréstimo (' + DateToStr(pRPI.DATAULTFECH) + ')';
   OperComum.LimpaParametros(qryEmprestimo);
   dbgEmprestimo.FixedCols := 1;
   EmpLiberarTodasColunas.Enabled := False;
   EmpLiberarColuna.Enabled := False;
   EmpFixarColuna.Enabled := True;

   btImprimir.Enabled := False;
   OperComum.LimpaParametros(dmRelAgendaEventos.qryAgendaEventos);
   OperComum.LimpaParametros(dmRelAgendaEventos.qryAgendaEventosDet);

   qryTipoInvest.First;
   dblTipoInv.LookUpValue := '0';
   dblTipoInv.Text := 'Todos';
end;

procedure TfrmConsAgendaEventos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbreQuery;
end;

procedure TfrmConsAgendaEventos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FechaQuery;
end;

procedure TfrmConsAgendaEventos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoInvest.Close;
end;

procedure TfrmConsAgendaEventos.dblTipoInvChange(Sender: TObject);
begin
   inherited;
   Case StrToInt(dblTipoInv.LookupValue) of
   0: begin
         tbsRendaVariavel.TabVisible := True;
         tbsRendaVariavel.Caption := 'Renda &Variável (' + DateToStr(pRPI.DATAULTFECH) + ')';
         tbsRendaFixa.TabVisible := True;
         tbsRendaFixa.Caption := 'Renda &Fixa (' + DateToStr(pRPI.DATAULTFECHRF) + ')';
         tbsBMF.TabVisible := True;
         tbsBMF.Caption := '&BM&&F (' + DateToStr(pRPI.DATAULTFECHBMF) + ')';
         tbsEmprestimo.TabVisible := True;
         tbsEmprestimo.Caption := '&Empréstimo (' + DateToStr(pRPI.DATAULTFECH) + ')';
      end;
   1: begin
         tbsRendaVariavel.TabVisible := True;
         tbsRendaVariavel.Caption := 'Renda &Variável (' + DateToStr(pRPI.DATAULTFECH) + ')';
         if dblTipoInv.LookupValue = '1' then
         begin
            tbsRendaFixa.TabVisible := False;
            tbsBMF.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;
      end;
   2: begin
         tbsRendaFixa.TabVisible := True;
         tbsRendaFixa.Caption := 'Renda &Fixa (' + DateToStr(pRPI.DATAULTFECHRF) + ')';
         if dblTipoInv.LookupValue = '2' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsBMF.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;
      end;
   3: begin
         tbsBMF.TabVisible := True;
         tbsBMF.Caption := '&BM&&F (' + DateToStr(pRPI.DATAULTFECHBMF) + ')';
         if dblTipoInv.LookupValue = '3' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsRendaFixa.TabVisible := False;
            tbsEmprestimo.TabVisible := False;
         end;
      end;
   4: begin
         tbsEmprestimo.TabVisible := True;
         tbsEmprestimo.Caption := '&Empréstimo (' + DateToStr(pRPI.DATAULTFECH) + ')';
         if dblTipoInv.LookupValue = '4' then
         begin
            tbsRendaVariavel.TabVisible := False;
            tbsRendaFixa.TabVisible := False;
            tbsBMF.TabVisible := False;
         end;
      end;
   end;

end;

end.



