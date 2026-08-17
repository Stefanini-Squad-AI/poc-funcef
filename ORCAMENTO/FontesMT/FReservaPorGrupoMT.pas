unit FReservaPorGrupoMT;
//==============================================================================
//   Data      : 20/12/2005
//   Autor     : Rodolpho da Silva
//   Pendência : 16460
//   Descrição : Criado esta tela
//==============================================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, wwdblook, CMDBLookupCombo, Db,
  DBClient, uCMClientDataSet, TREdit, Grids, Wwdbigrd, Wwdbgrid, uCtrlPlanPrevContabPatro,
  uCtrlPadroes, uCtrlTransacoesPorGrupo, uSistema, uModulo, uMensErro, uData,
  uString,
  // Alex 12/01/05 FUNCEF
  uCtrlPlanPrevContabil, uCtrlPatro;

type
  TFrmReservaPorGrupoMT = class(TfrmOkCancelar)
    pnlTop: TPanel;
    edtDescGrupo: TEdit;
    Label1: TLabel;
    btBuscGrupo: TSpeedButton;
    msGrupo: TMontaSelect;
    pnlBottom: TPanel;
    cboPlanoTrab: TCMDBLookupCombo;
    Label2: TLabel;
    CdsPlanoTrab: TCMClientDataSet;
    cboPlano: TCMDBLookupCombo;
    cboPatro: TCMDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    btSelContas: TBitBtn;
    grid: TwwDBGrid;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsRatCriter: TCMClientDataSet;
    CdsContas: TCMClientDataSet;
    ds: TDataSource;
    Label5: TLabel;
    cboRatCriter: TCMDBLookupCombo;
    Label6: TLabel;
    edtVlrRateio: TDBRealEdit;
    btCalcularRat: TSpeedButton;
    CdsValorCentCust: TCMClientDataSet;
    CdsDataView: TCMClientDataSet;
    CdsValorCentCustAux: TCMClientDataSet;
    procedure btBuscGrupoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cboPlanoEnter(Sender: TObject);
    procedure cboPatroEnter(Sender: TObject);
    procedure CdsContasAfterOpen(DataSet: TDataSet);
    procedure btSelContasClick(Sender: TObject);
    procedure gridUpdateFooter(Sender: TObject);
    procedure gridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure gridTopRowChanged(Sender: TObject);
    procedure btCalcularRatClick(Sender: TObject);
    procedure gridRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;

    // Alex 12/01/06 FUNCEF
    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    CtrlPatro               : TCtrlPatro;

  public
    { Public declarations }
  end;






var
  FrmReservaPorGrupoMT: TFrmReservaPorGrupoMT;

implementation

{$R *.DFM}




procedure TFrmReservaPorGrupoMT.btBuscGrupoClick(Sender: TObject);
begin
  inherited;
  msGrupo.Executar;
  if msGrupo.RetornouValor then
  begin
    edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];
  end;
end;




procedure TFrmReservaPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);

  CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(padroes);

  // Alex 12/01/06 FUNCEF
  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPatro.InitializeAs(Padroes);
  CdsPlano.Data := CtrlPlanPrevContabil.ListaPlanPrevContabil; // CRIAR PARÂMETRO PARA IMPRIMIR APENAS ATIVOS
  CdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento;
  // fim Alex 12/01/06 FUNCEF

  CdsContas.Data    := CtrlTransacoesPorGrupo.ListaReservaContas(-1,Sistema.IdUsuario,Sistema.IdEmpresa,-1,-1,-1,-1,DateToStr(now));
  CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaReservaPlanoTrab(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsRatCriter.Data := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);

  // 11/01/2006 Alex FUNCEF
  msGrupo.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TFrmReservaPorGrupoMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  // Alex 12/01/06 FUNCEF
  FreeAndNil (CtrlPlanPrevContabil);
  FreeAndNil (CtrlPatro);
  // fim Alex 12/01/06 FUNCEF
  inherited;
end;




procedure TFrmReservaPorGrupoMT.cboPlanoEnter(Sender: TObject);
begin
  inherited;
  // Alex 12/01/06 funcef CdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,StrToIntDef(cboPatro.LookupValue,-1),-1);
end;




procedure TFrmReservaPorGrupoMT.cboPatroEnter(Sender: TObject);
begin
  inherited;
  // Alex 12/01/06 funcef CdsPatro.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(StrToIntDef(cboPlano.LookupValue,-1),-1,-1);
end;




procedure TFrmReservaPorGrupoMT.CdsContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField(CdsContas.FieldByName('DATAREFERENCIA')).ReadOnly := True;
  TFloatField(CdsContas.FieldByName('VLRRESERVA')).EditFormat      := '#,##0.00';
  TFloatField(CdsContas.FieldByName('VLRRESERVA')).DisplayFormat   := '#,##0.00';
  TFloatField(CdsContas.FieldByName('SALDO')).DisplayFormat        := '#,##0.00';
  TFloatField(CdsContas.FieldByName('SALDO')).ReadOnly             := True;
  TStringField(CdsContas.FieldByName('IDCONTAORCAMEN')).ReadOnly   := True;
  TStringField(CdsContas.FieldByName('IDCONTAORCAMEN')).ReadOnly   := True;
  TStringField(CdsContas.FieldByName('CODCENTRORESPON')).ReadOnly  := True;
  TStringField(CdsContas.FieldByName('CRESP')).ReadOnly            := True;
  TStringField(CdsContas.FieldByName('CODCENTROCUSTO')).ReadOnly   := True;
  TStringField(CdsContas.FieldByName('NOME')).ReadOnly             := True;

end;




procedure TFrmReservaPorGrupoMT.btSelContasClick(Sender: TObject);
var
   iUnidNegoc,iIdPlano,iIdPatro: integer;
begin
  inherited;

  if Trim(edtDescGrupo.Text) = '' then
  begin
     MsgDlg('Informe um grupo de contas orçamentárias!','Aviso',mtWarning,[mbOK],0);
     Exit;
  end;

  if Trim(cboPlanoTrab.Text) <> '' then
     iUnidNegoc := CdsPlanoTrab.FieldByName('UNIDNEGOC').AsInteger
  else
     iUnidNegoc := 0;

  if Trim(cboPlano.Text) <> '' then
     iIdPlano := StrToInt(cboPlano.LookupValue)
  else
     iIdPlano := -1;

  if Trim(cboPatro.Text) <> '' then
     iIdPatro := StrToInt(cboPatro.LookupValue)
  else
     iIdPatro := -1;

  // Alex 12/01/01 FUNCEF
  if (iIdPlano <> -1) and (iIdPatro <> -1) then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iIdPatro, iIdPlano) then begin
      MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
      exit;
    end;

  CdsContas.Data := CtrlTransacoesPorGrupo.ListaReservaContas(Modulo.iPlanoOrc,
                                                              Sistema.IdUsuario,
                                                              Sistema.IdEmpresa,
                                                              StrToInt(msGrupo.ValoresChave[0]),
                                                              iUnidNegoc,
                                                              iIdPlano,
                                                              iIdPatro,
                                                              DateToStr(date));
end;




procedure TFrmReservaPorGrupoMT.gridUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rVlrReservaTotal,rVlrSaldoTotal: double;

begin
  inherited;
  try
    CdsAux           := TClientDataSet.Create(nil);
    CdsAux.Data      := CdsContas.Data;
    rVlrReservaTotal := 0;
    rVlrSaldoTotal   := 0;
    while not CdsAux.Eof do
    begin
       rVlrReservaTotal := rVlrReservaTotal + CdsAux.FieldByName('VLRRESERVA').AsFloat;
       rVlrSaldoTotal   := rVlrSaldoTotal + CdsAux.FieldByName('SALDO').AsFloat;
       CdsAux.Next;
    end;
    Grid.ColumnByName('VLRRESERVA').FooterValue := FormatFloat('#,##0.00',rVlrReservaTotal);
    Grid.ColumnByName('SALDO').FooterValue := FormatFloat('#,##0.00',rVlrSaldoTotal);

  finally
     FreeAndNil(CdsAux);
  end;
end;




procedure TFrmReservaPorGrupoMT.gridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;




procedure TFrmReservaPorGrupoMT.gridTopRowChanged(Sender: TObject);
begin
  inherited;
   Grid.Invalidate;
end;




procedure TFrmReservaPorGrupoMT.btCalcularRatClick(Sender: TObject);
var
   rTotal     : Double;
   bComLike   : Boolean;
   bComData   : Boolean;
   bComAnoMes : Boolean;
   sAnoMes    : String;
   sSQL       : TStringList;
   dDataRef   : TDateTime;
   iExercicio : Integer;
   iPeriodo   : Integer;
   sAntigo, sNovo : String;


begin
  inherited;
  try
     sSQL := TStringList.Create;

     if CdsContas.IsEmpty then
        Exit
     else
     if Trim(cboRatCriter.Text) = '' then
     begin
        MsgDlg('Obrigatório indicar o Critério', 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        cboRatCriter.SetFocus;
        Exit;
     end;

     //  Se o tipo de critério para rateio for manual...
     if (CdsRatCriter.FieldByName('TIPORATEIO').AsString = 'M') then
     begin
        CdsContas.DisableControls;
        CdsContas.First;
        rTotal     := 0;
        iExercicio := Year(CdsContas.FieldByName('DATAREFERENCIA').AsDateTime);
        iPeriodo   := CtrlTransacoesPorGrupo.RetornaPeriodo(CdsContas.FieldByName('DATAREFERENCIA').AsString);

        while not(CdsContas.EOF) do
        begin
           //  Pega o valor do Centro de Custo
           CdsValorCentCust.Data := CtrlTransacoesPorGrupo.ListaReservaValorCC(Sistema.IdEmpresa,
                                                                               iExercicio,
                                                                               iPeriodo,
                                                                               StrToInt(cboRatCriter.LookupValue),
                                                                               Espaco(CdsContas.FieldByName('CODCENTROCUSTO').AsString,10));

           // Insere o valor da reserva de acordo com o critério de rateio
           CdsContas.Edit;
           CdsContas.FieldByName('VLRRESERVA').AsFloat        := CdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
           cdsContas.FieldByName('DATAREFERENCIA').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
           CdsContas.Post;

           rTotal := rTotal + CdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
           CdsContas.Next;
        end;

        if rTotal <> 0 then
        begin
           CdsContas.First;
           while not(CdsContas.EOF) do
           begin
              CdsContas.Edit;
              CdsContas.FieldByName('VLRRESERVA').AsFloat := edtVlrRateio.Value * (CdsContas.FieldByName('VLRRESERVA').AsFloat / rTotal);
              CdsContas.Post;
              CdsContas.Next;
           end;
        end;
        CdsContas.First;
        CdsContas.EnableControls;
     end;


     if CdsRatCriter.FieldByName('TIPORATEIO').AsString = 'G' then
     begin
        CdsDataView.Data := CtrlTransacoesPorGrupo.ListaReservaDataView(CdsRatCriter.FieldByName('IDDATAVIEW').AsInteger);

        if not(CdsDataView.FieldByName('TEMPLATE').isNull) then
        begin
           sSQL.Add(CdsDataView.FieldByName('TEMPLATE').AsString);
           dDataRef := Date;

           if not(CdsRatCriter.FieldByName('PERNUMERO').IsNull) then
              dDataRef := CdsRatCriter.FieldByName('PERDATFIM').AsDatetime;

           bComData := True;
           if Pos(':DATA',sSQL.Text) = 0 then
              bComData := False;

           sAnoMes  := '';
           bComLike := True;
           if Pos('LIKE :CODCENTROCUSTO',sSQL.Text) = 0 then
              bComLike := False;

           if Pos(':ANOMES',sSQL.Text) = 0 then
              bComAnoMes := False
           else
           begin
              bComAnoMes := True;
              sAnoMes    := FormatDateTime('yyyy', dDataRef) + FormatDateTime('mm', dDataRef);
           end;

           rTotal  :=0;
           CdsContas.DisableControls;
           CdsContas.First;

           while not(CdsContas.EOF) do
           begin
              if bComLike then
              begin
                 sAntigo   := 'LIKE :CODCENTROCUSTO';
                 sNovo     := 'LIKE ' + QuotedStr(TRIM(CdsContas.FieldByName('CODCENTROCUSTO').AsString)) + '%';
                 sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
              end
              else
              begin
                 sAntigo   := ':CODCENTROCUSTO';
                 sNovo     := QuotedStr(Espaco(CdsContas.FieldByName('CODCENTROCUSTO').AsString,10));
                 sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
              end;


              sAntigo   := ':IDEMPRESA';
              sNovo     := IntToStr(Sistema.idEmpresa);
              sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);


              if bComData then
              begin
                 sAntigo   := ':DATA';
                 sNovo     := DateToStr(dDataRef);
                 sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
              end;


              if bComAnoMes then
              begin
                 sAntigo   := ':ANOMES';
                 sNovo     :=  QuotedStr(sAnoMes);
                 sSQL.Text := StringReplace(sSQL.Text,sAntigo,sNovo,[rfReplaceAll]);
              end;


              CdsValorCentCustAux.Data := CtrlTransacoesPorGrupo.GetDataPacket(sSQL);

              CdsContas.Edit;
              CdsContas.FieldByName('VLRRESERVA').AsFloat := CdsValorCentCustAux.FieldByName('VALOR').AsFloat;
              CdsContas.Post;

              rTotal := rTotal + CdsValorCentCustAux.FieldByName('VALOR').AsFloat;

              CdsContas.Next;
           end;

           if rTotal <> 0 then
           begin
              CdsContas.First;

              while not(CdsContas.EOF) do
              begin
                 CdsContas.Edit;
                 CdsContas.FieldByName('VLRRESERVA').AsFloat := edtVlrRateio.Value * (CdsContas.FieldByName('VLRRESERVA').AsFloat/rTotal);
                 CdsContas.Post;
                 CdsContas.Next;
              end;
           end;

           CdsContas.First;
           CdsContas.EnableControls;
        end;
     end;

   finally
      FreeAndNil(sSQL);
   end;
end;




procedure TFrmReservaPorGrupoMT.gridRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  if CdsContas.FieldByName('VALIDAR').AsString <> 'S' then
    TFloatField(CdsContas.FieldByName('VLRRESERVA')).ReadOnly := True
  else
    TFloatField(CdsContas.FieldByName('VLRRESERVA')).ReadOnly := False;
end;




procedure TFrmReservaPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if not CtrlTransacoesPorGrupo.AplicarReservaPorGrupo(CdsContas.Data,
                                                        Modulo.sPermiteSaldoNeg,
                                                        Sistema.IdModulo,
                                                        Sistema.IdEmpresa,
                                                        Modulo.iPlanoOrc) then
      MsgDlg('Não foi possível inserir reservas orçamentárias para as contas do grupo. Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtError,[mbOk],0)
   else
   begin
      CdsContas.Data := CtrlTransacoesPorGrupo.ListaReservaContas(-1,Sistema.IdUsuario,Sistema.IdEmpresa,-1,-1,-1,-1,DateToStr(now));
      MsgDlg('Reservas inseridas com sucesso!','Aviso',mtInformation,[mbOk],0);
   end;
end;




end.
