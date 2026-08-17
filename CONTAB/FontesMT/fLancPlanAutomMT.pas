unit fLancPlanAutomMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, fcTreeView, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet, uCtrlPeriodo,
  uCtrlPrePlanilhaLA,uCtrlContab,uSistema,dBaseDados,uMensErro,uVerificaPreenchimento,
  Wwdatsrc, uCmSqlParams, Menus, wwriched;

type
  TfrmLancPlanAutomMT = class(TfrmWizardMT)
    cdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    cdsPlaAutomaticas: TCMClientDataSet;
    cdsLaAutomaticas: TwwDataSource;
    Panel3: TPanel;
    CdsContasPlan: TCMClientDataSet;
    SqlContasPlan: TCMSqlParams;
    dsContasPlan: TwwDataSource;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    edtFase: TEdit;
    lblComecaCom: TLabel;
    edComecaCom: TEdit;
    btnMarcarFiltro: TSpeedButton;
    TabSheet2: TTabSheet;
    lbStatus: TfcLabel;
    PageCtrlDados: TPageControl;
    tbsPlanilhas: TTabSheet;
    Grid: TwwDBGrid;
    tbsContas: TTabSheet;
    wwDBGrid2: TwwDBGrid;
    Label3: TLabel;
    dblkExerc: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label14: TLabel;
    edtInicio: TCMDateTimePicker;
    Label1: TLabel;
    edtFim: TCMDateTimePicker;
    dlgSalvar: TSaveDialog;
    PopupMenu: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    meErros: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercExit(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure CdsContasPlanAfterOpen(DataSet: TDataSet);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure wwDBGrid2TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnMarcarFiltroClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure PageCtrlDadosChange(Sender: TObject);
    procedure dblkExercCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cdsPlaAutomaticasAfterOpen(DataSet: TDataSet);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanilhaLA :TCtrlPrePlanilhaLA;
    CtrlContab     :TCtrlContab;
    CtrlPeriodo    :TCtrlPeriodo;


    //  Funções
    function  VerificaPreenchimento: boolean;


    //  Procedures
    procedure  MontaDataIniFim;




   
  public
    { Public declarations }
    procedure Progresso(vParam : Array of Variant);

  end;



  
var
  frmLancPlanAutomMT: TfrmLancPlanAutomMT;

implementation

  uses FProgressoDuplo;

{$R *.DFM}

procedure TfrmLancPlanAutomMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe planilha ***
  CtrlPlanilhaLA   := TCtrlPrePlanilhaLA.Create(Sistema.IdEmpresa);
  CtrlPlanilhaLA.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsPlaAutomaticas.Data := CtrlPlanilhaLA.CarregaPlanilhasComp(Sistema.IdEmpresa);
  CtrlPlanilhaLA.cdsPlaSelecionadas := cdsPlaAutomaticas;
  CtrlPlanilhaLA.Progresso := Progresso;


  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  cdsExercicio.Data :=  CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);
  CdsPeriodo.Data   :=  CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,0,0);
  PageCtrlDados.ActivePageIndex := 0;

end;




procedure TfrmLancPlanAutomMT.dblkExercExit(Sender: TObject);
var
  iExercicio: integer;

begin
  inherited;
  if Trim(dblkExerc.LookupValue) <> '' then
     iExercicio := StrToInt(dblkExerc.LookUpValue)
  else
     iExercicio := 0;
  CdsPeriodo.Data  := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,iExercicio,0);
end;




function TfrmLancPlanAutomMT.VerificaPreenchimento: boolean;
begin
  Result := False;
  try

    case PagControle.ActivePageIndex of
       //  Críticas da página inicial
       0: begin
             if Trim(dblkExerc.Text) = '' then
                raise EValidacao.createVal('Para poder prosseguir, é preencher o exercício!',dblkExerc);
             if Trim(dblkPeriodo.Text) = '' then
                raise EValidacao.createVal('Para poder prosseguir, é preencher o período!',dblkPeriodo);
             if edtInicio.Text = '' then
                raise EValidacao.createVal('A data inicial não pode estar nula!',edtInicio);
             if edtFim.Text = '' then
                raise EValidacao.createVal('A data final não pode estar nula!',edtFim);
             if edtInicio.Date > edtFim.Date then
                raise EValidacao.CreateVal('A data inicial não pode ser maior que a data final!',edtInicio);
          end;
    end;



  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;




procedure TfrmLancPlanAutomMT.btnContinuarClick(Sender: TObject);
begin
  if VerificaPreenchimento then
  begin
     PagControle.ActivePageIndex := 1;
     btnConfirmar.Enabled := True;
     btnVoltar.Enabled    := True;
     btnContinuar.Enabled := False;

     if PagControle.ActivePageIndex = 1 then
     begin
       CdsContasPlan.Close;
       SqlContasPlan.Prepare;
       SqlContasPlan.ParamByName('PANCODIGO').AsString := cdsPlaAutomaticas.FieldByName('PANCODIGO').AsString;
       SqlContasPlan.Open;
     end;
  end;
end;




procedure TfrmLancPlanAutomMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmLancPlanAutomMT.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmLancPlanAutomMT.CdsContasPlanAfterOpen(DataSet: TDataSet);
begin
  inherited;
   TStringField(CdsContasPlan.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
end;




procedure TfrmLancPlanAutomMT.spdTodosClick(Sender: TObject);
begin
  inherited;
  cdsPlaAutomaticas.DisableControls;
  cdsPlaAutomaticas.First;
  while not cdsPlaAutomaticas.Eof do
  begin
     cdsPlaAutomaticas.Edit;
     cdsPlaAutomaticas.FieldByName('SEL').AsString := 'S';
     cdsPlaAutomaticas.Post;
     cdsPlaAutomaticas.Next;
  end;
  cdsPlaAutomaticas.EnableControls;
end;




procedure TfrmLancPlanAutomMT.spdInverterClick(Sender: TObject);
begin
  inherited;
  cdsPlaAutomaticas.DisableControls;
  cdsPlaAutomaticas.First;
  while not cdsPlaAutomaticas.Eof do
  begin
     cdsPlaAutomaticas.Edit;
     if cdsPlaAutomaticas.FieldByName('SEL').AsString = 'S' then
        cdsPlaAutomaticas.FieldByName('SEL').AsString := 'N'
     else
        cdsPlaAutomaticas.FieldByName('SEL').AsString := 'S';
     cdsPlaAutomaticas.Post;
     cdsPlaAutomaticas.Next;
  end;
  cdsPlaAutomaticas.EnableControls;
end;




procedure TfrmLancPlanAutomMT.wwDBGrid2TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsContasPlan.IndexFieldNames := AFieldName;
end;

procedure TfrmLancPlanAutomMT.btnMarcarFiltroClick(Sender: TObject);
var
  iNum, iPos, i, iFase, iFaseSel : Integer;
  sLinha, sPlanilha: string;
begin
  inherited;

  iNum := length(trim(edComecaCom.Text));
  iFaseSel := StrToIntDef(trim(edtFase.Text),-1);

  cdsPlaAutomaticas.DisableControls;
  cdsPlaAutomaticas.First;
  while not cdsPlaAutomaticas.Eof do
  begin
     // Se a fase for selecionada
     if (trim(edtFase.Text) <> '') then
     begin
        if ((Copy(cdsPlaAutomaticas.FieldByName('PANFASE').AsString,1,Length(edtFase.Text)) = Trim(edtFase.Text)) and
            (Copy(cdsPlaAutomaticas.FieldByName('PANDESCRICAO').AsString,1,Length(edComecaCom.Text)) = Trim(edComecaCom.Text))) then
        begin
           cdsPlaAutomaticas.Edit;
           cdsPlaAutomaticas.FieldByName('SEL').AsString := 'S';
           cdsPlaAutomaticas.Post;
        end;

     // Se a fase não for selecionada
     end
     else
     begin
       if (Copy(cdsPlaAutomaticas.FieldByName('PANDESCRICAO').AsString,1,Length(edComecaCom.Text)) = Trim(edComecaCom.Text)) then
       begin
          cdsPlaAutomaticas.Edit;
          cdsPlaAutomaticas.FieldByName('SEL').AsString := 'S';
          cdsPlaAutomaticas.Post;
       end;
     end;
     cdsPlaAutomaticas.Next;
  end;
  cdsPlaAutomaticas.EnableControls;
end;




procedure TfrmLancPlanAutomMT.btnVoltarClick(Sender: TObject);
begin
   PagControle.ActivePageIndex := 0;
   btnConfirmar.Enabled := False;
   btnVoltar.Enabled    := False;
   btnContinuar.Enabled := True;
end;




procedure TfrmLancPlanAutomMT.btnConfirmarClick(Sender: TObject);
begin
   PagControle.ActivePageIndex := 2;
   btnConfirmar.Enabled := False;
   btnContinuar.Enabled := False;
   meErros.Lines.Clear;
   if meErros.CanFocus then meErros.SetFocus;
   meErros.Lines.Add('Início do processamento:  ' + FormatDateTime('dd/mm/yyyy hh:nn', Date + time ));
   meErros.Lines.Add('');

   if not CtrlPlanilhaLA.ProcessaPlanilhas('',Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo,
                                           CtrlContab.PlanoParam,StrToInt(dblkPeriodo.LookUpValue),
                                           StrToInt(dblkExerc.Text),edtFim.Date,edtInicio.Date,Sistema.UsaPlanoPatro) then
   begin
      MsgDlg('Não foi possível efetuar os lançamentos das planilhas. Motivo:  ' + CtrlPlanilhaLA.MessageInfo,'Aviso',mtError,[mbOK],0);
      frmProgressoDuplo.EscondeFormProgressoDuplo;
      meErros.Lines.Add('Fim do processamento:  ' + FormatDateTime('dd/mm/yyyy hh:nn', Date + time ));
      meErros.Lines.Add('');
   end
   else
   begin
      meErros.Lines.Add('');
      meErros.Lines.Add('');
      meErros.Lines.Add('');
      meErros.Lines.Add('Fim do processamento:  ' + FormatDateTime('dd/mm/yyyy hh:nn', Date + time ));
      meErros.Lines.Add('');
      MsgDlg('Lançamentos Automáticos realizados com sucesso!!!','Aviso',mtInformation,[mbOK],0);
   end;
end;




procedure TfrmLancPlanAutomMT.Progresso(vParam: array of Variant);
begin
//  Legenda do FormProgresso
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado

   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],  // Legenda  (de cima)
                                                    vParam[9],  // Legenda  (de baixo)
                                                    vParam[2],  // Mínimo   (de cima)
                                                    vParam[6],  // Mínimo   (de baixo)
                                                    vParam[3],  // Máximo   (de cima)
                                                    vParam[7],  // Máximo   (de baixo)
                                                    False,      // Botão Visivel
                                                    False       // Botão Habilitado
                                                   );

      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmProgressoDuplo.Legenda  := vParam[5];
         frmProgressoDuplo.Legenda2 := vParam[9];
         frmProgressoDuplo.Max2     := vParam[7];
         frmProgressoDuplo.AndaFormProgressoDuplo(vParam[4], vParam[8]);
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmProgressoDuplo.EscondeFormProgressoDuplo;

      end;
      // -------------------------------------------------------------------------------------------
   end;

   if Trim(vParam[10]) <> '' then
      meErros.Lines.Add(vParam[10]);


   Application.ProcessMessages;
   Repaint;
end;




procedure TfrmLancPlanAutomMT.PageCtrlDadosChange(Sender: TObject);
begin
  inherited;
  if PageCtrlDados.ActivePageIndex = 1 then
  begin
     CdsContasPlan.Close;
     SqlContasPlan.Prepare;
     SqlContasPlan.ParamByName('PANCODIGO').AsString := cdsPlaAutomaticas.FieldByName('PANCODIGO').AsString;
     SqlContasPlan.Open;
  end;
end;




procedure TfrmLancPlanAutomMT.MontaDataIniFim;
begin
  if (dblkExerc.Text <> '') and (dblkPeriodo.Text <> '') then begin
     CtrlPeriodo.Exercicio := cdsExercicio.FieldByName('PEREXERCICIO').AsInteger;
     CtrlPeriodo.Periodo   := cdsPeriodo.FieldByName('PERNUMERO').AsInteger;

     edtInicio.Date := strtodate ('1/'+IntToStr(CtrlPeriodo.Periodo)+'/'+IntToStr(CtrlPeriodo.Exercicio));
     edtFim.Date    := DiasUteis.UltDiaMes(CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo);
  end;
end;




procedure TfrmLancPlanAutomMT.dblkExercCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkExerc.Text <> '' then begin
    cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExerc.LookupValue),0);
    dblkPeriodo.Enabled := true;
  end else
    dblkPeriodo.Enabled := false;

  MontaDataIniFim;
end;




procedure TfrmLancPlanAutomMT.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaDataIniFim;
end;




procedure TfrmLancPlanAutomMT.cdsPlaAutomaticasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TStringField(DataSet.FieldByName('GERAPLANPOR')).ReadOnly  := True;
  TStringField(DataSet.FieldByName('PANFASE')).ReadOnly      := True;
  TStringField(DataSet.FieldByName('PANDESCRICAO')).ReadOnly := True;
end;




procedure TfrmLancPlanAutomMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  DlgSalvar.Execute;
  if DlgSalvar.FileName <> '' then
    meErros.Lines.SaveToFile(DlgSalvar.FileName);
end;




procedure TfrmLancPlanAutomMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  meErros.Print('Log de operações');
end;

end.
