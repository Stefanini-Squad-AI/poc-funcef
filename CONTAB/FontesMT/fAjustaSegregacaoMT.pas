unit fAjustaSegregacaoMT;

{-------------------------------------------------------------------------
Analista  : Antonio Marcos Fernandes de Souza (amf)
Rotina    : Ajusta Planilha
Data      : 20.03.2007
Pendência : 24589
Descrição : Alterado para permitir o ajuste possíveis diferenças encontradas
            na memória de cálculo. 
-------------------------------------------------------------------------

{**********************************************************************}
{  Tela criada em : 14/04/2005                                         }
{  Desenvolvedor  : Rodolpho da Silva                                  }
{  Pendência      : 18434                                              }
{  Descrição      : Criar tela para ajuste de segregação divergente    }
{                                                                      }
{**********************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Grids, Wwdbigrd, uSistema,
  Wwdbgrid,uVerificaPreenchimento, Db, Wwdatsrc, DBClient, uCtrlPadroes,
  uMensErro,  uCMClientDataSet, uCtrlSegregacaoProc, uCmSqlParams, Gauges,
  DBTables, CMDatabase, CMProcuraMask, wwdblook, uctrlParamGlobal;

type
  TFrmAjustaSegregacaoMT = class(TfrmWizardMT)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GridDet: TwwDBGrid;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    SqlLancDivergDet: TCMSqlParams;
    cdsLancDivergDet: TCMClientDataSet;
    dsLancDivergDet: TwwDataSource;
    SqlLancDivergMestre: TCMSqlParams;
    cdsLancDivergMestre: TCMClientDataSet;
    dsLancDivergMestre: TwwDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    GridMestre: TwwDBGrid;
    Shape1: TShape;
    Label5: TLabel;
    Panel7: TPanel;
    fcLabel3: TfcLabel;
    Panel8: TPanel;
    mmLogErros: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Panel11: TPanel;
    edtInicio: TCMDateTimePicker;
    edtFim: TCMDateTimePicker;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtValorDiverg: TDBRealEdit;
    gaProgresso: TGauge;
    Bevel1: TBevel;
    Panel9: TPanel;
    Panel10: TPanel;
    Shape2: TShape;
    Label8: TLabel;
    SqlSelUltConta: TCMSqlParams;
    CdsSelUltConta: TCMClientDataSet;
    rdgPlano: TRadioGroup;
    procedure GridDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridDetTopRowChanged(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure GridMestreTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GridMestreRowChanged(Sender: TObject);
    procedure cdsLancDivergMestreAfterOpen(DataSet: TDataSet);
    procedure cdsLancDivergDetAfterOpen(DataSet: TDataSet);
    procedure GridMestreCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridDetTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridDetUpdateFooter(Sender: TObject);
    procedure GridMestreFieldChanged(Sender: TObject; Field: TField);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlSegregacaoProc : TCtrlSegregacaoProc;

    //amf 15.03.2007 - define se é para processar a segregação da memória de cálculo.
    bSegMemoCalc: boolean;
    cdsLocal: TClientDataSet;
    ctrlParamGlobal: TCtrlParamGlobal;

    procedure SelecionaPlanilhaDet(dInicio,dFim: TDate; iPlanilha: integer; sNumDoc: string);
    function  VerififcaPreenchimento : Boolean;

    //amf 15.03.2007 24589 - modularização para facilitar o entendimento da rotina.
    procedure AjustaPlanilha;
    procedure EscreveLogErro(sPlanilha,sPlano,sPatro,sDiferenca,sMotivo: string);


  public
    { Public declarations }
  end;




var
  FrmAjustaSegregacaoMT: TFrmAjustaSegregacaoMT;

implementation

{$R *.DFM}



procedure TFrmAjustaSegregacaoMT.GridDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat <> 0 then
     ABrush.Color := $00A0A0FC; // Vermelho claro
end;




procedure TFrmAjustaSegregacaoMT.GridDetTopRowChanged(Sender: TObject);
begin
  inherited;
  //  Ajusta as cores do grid
  (sender as TwwDBgrid).Invalidate;
end;



procedure TFrmAjustaSegregacaoMT.btnContinuarClick(Sender: TObject);
begin

  case PagControle.ActivePageIndex of
     //  Pulando da página de seleção de período(0) para a página de seleção de planilhas(1)
     0 : begin
            if VerififcaPreenchimento then
            begin

               if (not bSegMemoCalc) then
               begin
               cdsLancDivergMestre.Close;
               SqlLancDivergMestre.Prepare;
               SqlLancDivergMestre.ParamByName('INICIO').AsDate := edtInicio.Date;
               SqlLancDivergMestre.ParamByName('FIM').AsDate    := edtFim.Date;
               SqlLancDivergMestre.Open;
               end
               else
                  cdsLancDivergMestre.Data := CtrlSegregacaoProc.RetornaDivergMemoCalcMaster
                                              (edtinicio.Date,
                                               edtFim.Date,
                                               cdsLocal.FieldByName('IDPLANOPREV').AsInteger);

               inherited;
               btnConfirmar.Enabled := True;
               btnContinuar.Enabled := False;
            end;
         end;
   end;
end;



procedure TFrmAjustaSegregacaoMT.spdTodosClick(Sender: TObject);
begin
  inherited;
  cdsLancDivergMestre.DisableControls;
  cdsLancDivergMestre.First;

  while not cdsLancDivergMestre.Eof do
  begin

     //  Só marca o flg se o débito bater com o crédito
     if (cdsLancDivergMestre.FieldByName('DIFERENCA').AsFloat = 0) then
     begin
        cdsLancDivergMestre.Edit;
        cdsLancDivergMestre.FieldByName('CHECADO').AsString := 'S';
        cdsLancDivergMestre.Post;
     end;

    cdsLancDivergMestre.Next;
  end;
  cdsLancDivergMestre.EnableControls;
end;




procedure TFrmAjustaSegregacaoMT.spdInverterClick(Sender: TObject);
begin
  inherited;
  cdsLancDivergMestre.DisableControls;
  cdsLancDivergMestre.First;

  while not cdsLancDivergMestre.Eof do
  begin
     if cdsLancDivergMestre.FieldByName('CHECADO').AsString = 'S' then
     begin
        //  Desmarca campo
        cdsLancDivergMestre.Edit;
        cdsLancDivergMestre.FieldByName('CHECADO').AsString := 'N';
        cdsLancDivergMestre.Post;
     end
     else
     begin
        //  Marca campo somente se o débito bater com o crédito
        if (cdsLancDivergMestre.FieldByName('DIFERENCA').AsFloat = 0) then
        begin
           cdsLancDivergMestre.Edit;
           cdsLancDivergMestre.FieldByName('CHECADO').AsString := 'S';
           cdsLancDivergMestre.Post;
        end;   
     end;
     cdsLancDivergMestre.Next;
  end;
  cdsLancDivergMestre.EnableControls;
end;




procedure TFrmAjustaSegregacaoMT.GridMestreTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsLancDivergMestre.IndexFieldNames := AFieldName;
end;




procedure TFrmAjustaSegregacaoMT.GridMestreRowChanged(Sender: TObject);
begin
  inherited;
  SelecionaPlanilhaDet(edtInicio.Date,edtFim.Date,cdsLancDivergMestre.FieldByName('PLNCODIGO').AsInteger,cdsLancDivergMestre.FieldByName('LACNUMDOC').AsString);
end;




procedure TFrmAjustaSegregacaoMT.cdsLancDivergMestreAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('LANCREDITO')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('LANDEBITO')).DisplayFormat  := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('DIFERENCA')).DisplayFormat  := '#,##0.00;(#,##0.00)';
end;




procedure TFrmAjustaSegregacaoMT.cdsLancDivergDetAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('DIFERENCA')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('DEBITO')).DisplayFormat    := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('CREDITO')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;




procedure TFrmAjustaSegregacaoMT.GridMestreCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then
  begin
     //  Pinta a linha MESTRE que está com divergência e que não será ajustada
     if ((cdsLancDivergMestre.FieldByName('DIFERENCA').AsFloat <> 0) or (cdsLancDivergMestre.FieldByName('DIFERENCA').IsNull)) then
        ABrush.Color := $009E9E9E; // cinza escuro
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TFrmAjustaSegregacaoMT.GridDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsLancDivergDet.IndexFieldNames := AFieldName;
end;

procedure TFrmAjustaSegregacaoMT.btnConfirmarClick(Sender: TObject);

begin
   if VerififcaPreenchimento then
   begin

      mmLogErros.Lines.Clear;
      cdsLancDivergMestre.DisableControls;
      cdsLancDivergMestre.First;
      gaProgresso.MaxValue := cdsLancDivergMestre.RecordCount;
      gaProgresso.Progress := 0;

      AjustaPlanilha;

      cdsLancDivergMestre.EnableControls;
      btnConfirmar.Enabled := False;

      if mmLogErros.Lines.Count = 0 then
         MsgDlg('Processo concluído com sucesso!','Aviso',mtInformation,[mbOk],0)
      else
         MsgDlg('Processo concluído porém houve ajustes não efetuados. Verifique','Aviso',mtInformation,[mbOk],0);

   end;
end;




procedure TFrmAjustaSegregacaoMT.SelecionaPlanilhaDet(dInicio, dFim: TDate;
  iPlanilha: integer; sNumDoc: string);
begin
  if (not bSegMemoCalc) then
  begin
  cdsLancDivergDet.Close;
  SqlLancDivergDet.Prepare;
  SqlLancDivergDet.ParamByName('INICIO').AsDate       := dInicio;
  SqlLancDivergDet.ParamByName('FIM').AsDate          := dFim;
  SqlLancDivergDet.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
  SqlLancDivergDet.ParamByName('NUMDOC').AsString     := sNumDoc;
  SqlLancDivergDet.Open;
  end
  else
     cdsLancDivergDet.Data := CtrlSegregacaoProc.RetornaDivergMemoCalcDetalhe(dinicio,
                                                                              dfim,
                                                                              cdsLocal.FieldByName('IDPLANOPREV').AsInteger,
                                                                              iplanilha,
                                                                              snumdoc);
end;


procedure TFrmAjustaSegregacaoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSegregacaoProc := TCtrlSegregacaoProc.Create;
  CtrlSegregacaoProc.InitializeAs(Padroes);

  ctrlSegregacaoProc.GetParams(Sistema.IdEmpresa);
  bSegMemoCalc := False;

  CtrlParamGlobal := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(Padroes);

  cdsLocal := TClientDataSet.Create(Self);

  cdsLocal.Data := ctrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);

  bSegMemoCalc := (cdsLocal.FieldByName('FLGSEGORADMFIN').AsString = 'S') or
                  (cdsLocal.FieldByName('FLGSEGORCOMFIN').AsString = 'S');

  if (CtrlSegregacaoProc.PlanoPrevAdm > 0) then
  begin
    if (not CtrlSegregacaoProc.SegregaOrAdm) and
       (not CtrlSegregacaoProc.SegregaOrComum) and
       (not bSegMemoCalc) then
    begin
      MsgDlg ('Nenhum Plano foi parametrizado para ajuste de segregação na origem.', 'Segregação', mtWarning, [mbok], 0);
      Close;
    end
    else
    begin
      if (ctrlSegregacaoProc.SegregaOrAdm) <> (ctrlSegregacaoProc.SegregaOrComum) and (not bSegMemoCalc) then
         rdgPlano.Enabled := False;

      if bSegMemoCalc then
      begin
         rdgPlano.Enabled := False;

         if (ctrlSegregacaoProc.SegregaOrAdm) and (ctrlSegregacaoProc.SegregaOrComum) then
            rdgPlano.Enabled := True;

         if (CtrlSegregacaoProc.SegregaOrAdm) then
            rdgPlano.ItemIndex := 1
         else if (ctrlSegregacaoProc.SegregaOrComum) then
                rdgPlano.ItemIndex := 0;
      end
      else
      begin
         // se somente está parametrizado Administrativo na Origem(no Global), então, será selecionado o Comun (segregação ao final do mês)
         if (CtrlSegregacaoProc.SegregaOrAdm) then
            rdgPlano.ItemIndex := 1
         // se somente está parametrizado o COMUM na Origem(no Global), então, será selecionado o Administrativo (segregação ao final do mês)
         else if (ctrlSegregacaoProc.SegregaOrComum) then
                rdgPlano.ItemIndex := 0;
      end;
    end;
  end;
end;

procedure TFrmAjustaSegregacaoMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlSegregacaoProc);

  FreeAndNil(ctrlParamGlobal);
end;




function TFrmAjustaSegregacaoMT.VerififcaPreenchimento: Boolean;
begin
   Result := False;
   try
     case PagControle.ActivePageIndex of

        //  Executa as validações da primeira tela (Seleção de período)
        0: begin
              if edtInicio.Date = 0 then
                 raise EValidacao.createVal('O campo DATA INICIAL não pode estar nula!',edtInicio)
              else
              if edtFim.Date = 0 then
                 raise EValidacao.createVal('O campo DATA FINAL não pode estar nula!',edtFim)
              else
              if edtInicio.Date > edtFim.Date then
                 raise EValidacao.createVal('A DATA INICIAL não pode ser maior que a DATA FINAL!',edtInicio)
              else
              if edtValorDiverg.Value = 0 then
                 raise EValidacao.createVal('Informe um valor parta ajuste de divergência!',edtValorDiverg)
              else
                 Result := True;
           end;


        //  Executa as validações da saegunda tela (Seleção de planilhas divergentes)
        1: begin
              if cdsLancDivergDet.RecordCount = 0 then
                 raise EValidacao.createVal('Não há nenhuma planilha divergente a ajustar!',GridMestre)
              else
              begin
                 cdsLancDivergMestre.DisableControls;
                 cdsLancDivergMestre.First;

                 //  Varre o cds verificando se houve alguma seleção para fazer a crítica
                 while not cdsLancDivergMestre.Eof do
                 begin
                    if (cdsLancDivergMestre.FieldByName('CHECADO').AsString = 'S') then
                    begin
                       cdsLancDivergMestre.EnableControls;
                       PagControle.ActivePageIndex := 2;
                       Result := True;
                       Exit;
                    end;
                    cdsLancDivergMestre.Next;
                 end;


                 //  Se não for encontrado nenhuma planilha selecionada, é exibido a mensagem
                 cdsLancDivergMestre.EnableControls;
                 raise EValidacao.createVal('É necessário marcar uma planilha para poder prosseguir com esta operação!',GridMestre);
              end;
           end;
     end;



   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;




procedure TFrmAjustaSegregacaoMT.GridDetUpdateFooter(Sender: TObject);
var
    fValorCredito, fValDebito, fValDiferenca: Extended;
    cdsTemp : TCMClientDataSet;

begin
  inherited;
  fValorCredito := 0;
  fValDebito    := 0;
  fValDiferenca := 0;

  try
    try
       cdsTemp      := TCMClientDataSet.Create( nil );
       cdsTemp.Data := cdsLancDivergDet.Data;

       while not cdsTemp.Eof do begin
         fValorCredito := fValorCredito + cdsTemp.FieldByName('CREDITO').AsFloat;
         fValDebito    := fValDebito    + cdsTemp.FieldByName('DEBITO').AsFloat;
         fValDiferenca := fValDiferenca + cdsTemp.FieldByName('DIFERENCA').AsFloat;

         cdsTemp.Next;
       end;

       GridDet.ColumnByName('CREDITO').FooterValue   := FormatFloat('#,##0.00', fValorCredito);
       GridDet.ColumnByName('DEBITO').FooterValue    := FormatFloat('#,##0.00', fValDebito);
       GridDet.ColumnByName('DIFERENCA').FooterValue := FormatFloat('#,##0.00', fValDiferenca);

    except

    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;




procedure TFrmAjustaSegregacaoMT.GridMestreFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
   //  Só permiter marcar o flg se o débito não bater com o crédito
   if ((cdsLancDivergMestre.FieldByName('DIFERENCA').AsFloat <> 0) and
       (Field.AsString = 'S')) then

   begin
      cdsLancDivergMestre.Edit;
      cdsLancDivergMestre.FieldByName('CHECADO').AsString := 'N';
      cdsLancDivergMestre.Post;
   end;
end;




procedure TFrmAjustaSegregacaoMT.btnVoltarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of

     1: inherited;


     //  Pulando da página de início de processo (2) para a página de seleção de  planilhas(1)
     2 : begin
            //  Faz um refresh no Cds mestre
            cdsLancDivergMestre.Close;
            SqlLancDivergMestre.Prepare;
            SqlLancDivergMestre.ParamByName('INICIO').AsDate := edtInicio.Date;
            SqlLancDivergMestre.ParamByName('FIM').AsDate    := edtFim.Date;
            SqlLancDivergMestre.Open;

            //  Página de seleção de planilhas divergentes
            PagControle.ActivePageIndex := 1;
         end;
   end;
end;


procedure TFrmAjustaSegregacaoMT.AjustaPlanilha;
var
  iIdControleSegrega: integer;
begin

   // O mesmo número de controle de segegação deve ser usado por todos os ajustes
   iIdControleSegrega   := CtrlSegregacaoProc.RetornaIdControleSegrega;

   //  Varre o cds para ajustar as planilhas selecionadas
   while not cdsLancDivergMestre.Eof do
   begin
      //  Ajusta somente as planilhas que além de selecionadas, estão com a regra prova zero correta
      if (cdsLancDivergMestre.FieldByName('CHECADO').AsString = 'S') then
      begin

         //  Abre os detalhes da planilha em foco para ajustar
         SelecionaPlanilhaDet(edtInicio.Date,edtFim.Date,cdsLancDivergMestre.FieldByName('PLNCODIGO').AsInteger,cdsLancDivergMestre.FieldByName('LACNUMDOC').AsString);

         //  Varre o cdsDetalhe
         while not cdsLancDivergDet.Eof do
         begin

            //  Verifica se o lançamento exite divergência
            if cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat <> 0 then
            begin

               CdsSelUltConta.Close;
               SqlSelUltConta.Prepare;
               SqlSelUltConta.ParamByName('PLNCODIGO').AsString :=  cdsLancDivergDet.FieldByName('PLNCODIGO').AsString;
               SqlSelUltConta.ParamByName('IDPATRO').AsInteger  :=  cdsLancDivergDet.FieldByName('IDPATRO').AsInteger;
               SqlSelUltConta.ParamByName('IDPLANO').AsInteger  :=  cdsLancDivergDet.FieldByName('IDPLANOPREV').AsInteger;
               SqlSelUltConta.ParamByName('NUMDOC').AsString    :=  cdsLancDivergDet.FieldByName('LACNUMDOC').AsString;
               SqlSelUltConta.ParamByName('INICIO').AsDate      := edtInicio.Date;
               SqlSelUltConta.ParamByName('FIM').AsDate         := edtFim.Date;
               SqlSelUltConta.Open;

               // Antes de lançar o ajuste, verifica se a diferença encontrada nos Planos x Patros está dentro da
               //margem de ajuste, fornecida pelo usuário

               //  Se for um crédido...
               if ((cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat <= edtValorDiverg.Value) and (cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat > 0)) then
               begin
                  if not CtrlSegregacaoProc.AjustaPlanilha('1', // 0-Débito, 1-Crédito, 2-Ambos
                                                           cdsLancDivergDet.FieldByName('LACNUMDOC').AsString,
                                                           'AJUSTE DE SEGREGAÇÃO',
                                                           cdsLancDivergDet.FieldByName('CODCENTROCUSTO').AsString,
                                                           CdsSelUltConta.FieldByName('PLACONTA').AsString,
                                                           cdsLancDivergMestre.FieldByNAme('PLNDATDIA').AsString,
                                                           cdsLancDivergDet.FieldByName('DATASEGREGACRITER').AsString,
                                                           '',
                                                           '',
                                                           Sistema.UsaPlanoPatro,
                                                           Trunc(Sistema.IdEmpresa),
                                                           Trunc(Sistema.IdModulo),
                                                           Trunc(Sistema.IdUsuario),
                                                           0,
                                                           cdsLancDivergDet.FieldByName('UNIDNEGOC').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDPLANOPREV').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDPATRO').AsFloat,
                                                           iIdControleSegrega,
                                                           cdsLancDivergDet.FieldByName('PLNCODIGO').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDSEGREGACRITER').AsFloat,
                                                           cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat) then

                  //  Se não inserir o lançamento, informa a mensagem de erro
                  EscreveLogErro(cdsLancDivergMestre.FieldByName('PLNPLANIL').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPLANO').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPATRO').AsString,
                                 '',CtrlSegregacaoProc.MessageInfo);
               end
               else

               //  Se for um débito
               if (((cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat * -1) <= edtValorDiverg.Value) and (cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat < 0)) then
               begin
                  if not CtrlSegregacaoProc.AjustaPlanilha('0', // 0-Débito, 1-Crédito, 2-Ambos
                                                           cdsLancDivergDet.FieldByName('LACNUMDOC').AsString,
                                                           'AJUSTE DE SEGREGAÇÃO',
                                                           '',
                                                           '',
                                                           cdsLancDivergMestre.FieldByNAme('PLNDATDIA').AsString,
                                                           cdsLancDivergDet.FieldByName('DATASEGREGACRITER').AsString,
                                                           cdsLancDivergDet.FieldByName('CODCENTROCUSTO').AsString,
                                                           CdsSelUltConta.FieldByName('PLACONTA').AsString,
                                                           Sistema.UsaPlanoPatro,
                                                           Trunc(Sistema.IdEmpresa),
                                                           Trunc(Sistema.IdModulo),
                                                           Trunc(Sistema.IdUsuario),
                                                           0,
                                                           cdsLancDivergDet.FieldByName('UNIDNEGOC').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDPLANOPREV').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDPATRO').AsFloat,
                                                           iIdControleSegrega,
                                                           cdsLancDivergDet.FieldByName('PLNCODIGO').AsFloat,
                                                           cdsLancDivergDet.FieldByName('IDSEGREGACRITER').AsFloat,
                                                           (cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat * -1)) then

                  //  Se não inserir o lançamento, informa a mensagem de erro
                  EscreveLogErro(cdsLancDivergMestre.FieldByName('PLNPLANIL').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPLANO').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPATRO').AsString,
                                 '',CtrlSegregacaoProc.MessageInfo);
               end
               else

                  //  Grava o log de erro...
                  EscreveLogErro(cdsLancDivergMestre.FieldByName('PLNPLANIL').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPLANO').AsString,
                                 cdsLancDivergDet.FieldByName('NOMEPATRO').AsString,
                                 FormatFloat('#,##0.00;(#,##0.00)',cdsLancDivergDet.FieldByName('DIFERENCA').AsFloat),
                                 'Valor divergente fora da margem de ajuste.   ');

            end;

            //  Move o cursor para o próximo foco
            cdsLancDivergDet.Next;
         end;
      end;

      gaProgresso.AddProgress(1);
      cdsLancDivergMestre.Next;
   end;

end;

procedure TFrmAjustaSegregacaoMT.EscreveLogErro(sPlanilha, sPlano, sPatro,
  sDiferenca, sMotivo: string);
begin
   mmLogErros.Lines.Add('Ajuste não efetuado');
   mmLogErros.Lines.Add('-------------------');
   mmLogErros.Lines.Add('Período: ' + edtInicio.Text + ' à ' + edtFim.Text);
   mmLogErros.Lines.Add('Planilha:  ' + sPlanilha);
   mmLogErros.Lines.Add('Plano:  '  + sPlano);
   mmLogErros.Lines.Add('Patrocinadora:  ' + sPatro);
   mmLogErros.Lines.Add('Motivo:  ' + sMotivo + sDiferenca);
   mmLogErros.Lines.Add('');
   mmLogErros.Lines.Add('');
end;

end.
