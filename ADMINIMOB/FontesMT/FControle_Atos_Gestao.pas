{-------------------------------------------------------------------------------
Data...............: 19/10/2011
SOL................: 136331
Kintana............: 814994
Autor..............: Ricardo de Freitas Araújo
Descrição..........: Criação da Tela
-------------------------------------------------------------------------------}


unit FControle_Atos_Gestao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, ComCtrls,uCtrlControle_Atos_Gestao,USistema,DBaseDados, Db,
  DBClient, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, ppClass, ppComm,
  ppRelatv, ppProd, ppReport, uCmRptManager, ppPrnabl, ppCtrls, ppVar, jpeg,
  QExport3Dialog,QExport3, wwdbdatetimepicker, CMDateTimePicker, TXComp,
  TXRB, DBGrids;

type
  TfrmControle_Atos_Gestao = class(TForm)
    pnl1: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    btnenviar: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    btnSair: TBitBtn;
    btnimprimir: TBitBtn;
    btngerar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnBuscar: TBitBtn;
    pnlContratos: TPanel;
    dsContratos: TDataSource;
    cdsContratos: TClientDataSet;
    CrmRptCM: TCmRptManager;
    ppRelat: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    pplRelat: TppBDEPipeline;
    plbl1: TppLabel;
    ppImage1: TppImage;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    plblTotalContrato: TppLabel;
    plbl6: TppLabel;
    ppCalc48: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    plblValor: TppLabel;
    plbl11: TppLabel;
    plbl12: TppLabel;
    plbl13: TppLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    qeExporta: TQExport3Dialog;
    lbl5: TLabel;
    cdsContratos_Expotacao: TClientDataSet;
    cdsContratos_ExpotacaoDATA_CONTRATO: TDateField;
    cdsContratos_ExpotacaoDATA_EVENTO: TDateField;
    fltfldContratos_ExpotacaoVALOR: TFloatField;
    cdsContratos_ExpotacaoNOME_CONTRATO: TStringField;
    cdsContratos_ExpotacaoNUMERO_CONTRATO: TStringField;
    cdsContratos_ExpotacaoHISTORICO: TStringField;
    cdsContratos_ExpotacaoTIPOCONTRATO: TStringField;
    pnl2: TPanel;
    chkLocacao: TCheckBox;
    chkAlienacao: TCheckBox;
    plbl5: TppLabel;
    plbl10: TppLabel;
    ppDBText7: TppDBText;
    dtpinicial: TCMDateTimePicker;
    dtpfinal: TCMDateTimePicker;
    dbgrdContrato1: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnenviarClick(Sender: TObject);
    procedure btngerarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdContratoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdContrato1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdContrato1TitleClick(Column: TColumn);
    procedure dbgrdContrato1CellClick(Column: TColumn);
  private
    { Private declarations }
    function Retornar_Selecionados():integer;
    //Progresso utilizado internamente na método de envio de contrato(s)
    procedure Progresso(vParam : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmControle_Atos_Gestao: TfrmControle_Atos_Gestao;

implementation

uses FProgresso, FPreview;

{$R *.DFM}

procedure TfrmControle_Atos_Gestao.btnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmControle_Atos_Gestao.btnBuscarClick(Sender: TObject);
var
  C:integer;
begin
     //Consistências

     //MSG004
     if (dtpinicial.Text = '') then
     begin
       Application.MessageBox('Selecionar o período: Data inicial e Data Final.','Atenção',48);
       Exit;
     end;

     //MSG004
     if (dtpfinal.Text = '') then
     begin
       Application.MessageBox('Selecionar o período: Data inicial e Data Final.','Atenção',48);
       Exit;
     end;

     //MSG003
     if (chkLocacao.Checked = false) and (chkAlienacao.Checked = false)   then
     begin
       Application.MessageBox('Selecionar tipo de contrato.','Atenção',48);
       Exit;
     end;

     //MSG005
     if dtpfinal.DateTime < dtpinicial.DateTime then
     begin
       Application.MessageBox('O campo Data Final dever ser maior que o campo Data Inicial.','Atenção',48);
       Exit;
     end;

     //MSG006
     if dtpfinal.DateTime < dtpinicial.DateTime then
     begin
       Application.MessageBox('O campo Data Inicial dever ser menor que o campo Data Final.','Atenção',48);
       Exit;
     end;

     //Realizar Busca
     TRY
        Screen.Cursor := crHourGlass;
        pnlContratos.Caption := 'Contratos (0)';
        if cdsContratos.Active then cdsContratos.CLose;

        cdsContratos.Data := CtrlControle_Atos_Gestao.ListarContratos(dtpinicial.DateTime,dtpfinal.datetime,chkLocacao.Checked,chkAlienacao.Checked);
        (cdsContratos.FieldByName('VALOR') as TFloatField).currency := True;

        //Troca apelido do field VALOR

        for C:=0 to cdsContratos.FIelds.Count - 1 Do
        Begin
             cdsContratos.Fields[c].Visible := false;
             cdsContratos.Fields[c].DisplayLabel := 'Empty';
        end;

        cdsContratos.FieldByName('SEL').DisplayLabel := 'Selecionar';
        cdsContratos.FieldByName('DATA_CONTRATO').DisplayLabel := 'Dt. Contrato';
        cdsContratos.FieldByName('DATA_EVENTO').DisplayLabel := 'Data Evento';
        cdsContratos.FieldByName('NOME_CONTRATO').DisplayLabel := 'Nome Contrato';
        cdsContratos.FieldByName('NUMERO_CONTRATO').DisplayLabel := 'Nº Contrato';
        cdsContratos.FieldByName('HISTORICO').DisplayLabel := 'Histórico';
        cdsContratos.FieldByName('TIPOCONTRATO').DisplayLabel := 'Tipo Contrato';

        if (chkLocacao.Checked) and (chkAlienacao.Checked = false) then
           cdsContratos.FieldByName('VALOR').DisplayLabel := 'Valor Aluguel'
        else
        begin
          if (chkLocacao.Checked = false) and (chkAlienacao.Checked) then

             cdsContratos.FieldByName('VALOR').DisplayLabel := 'Valor Venda'
          else
              cdsContratos.FieldByName('VALOR').DisplayLabel := 'Valor Aluguel\Venda';
        end;

        for C:=0 to cdsContratos.FIelds.Count - 1 Do
        Begin
             if cdsContratos.Fields[c].DisplayLabel <> 'Empty' then
                cdsContratos.Fields[c].Visible := true;
        end;



        if cdsContratos.IsEmpty then
        begin
          //MSG002
          Application.MessageBox('Nenhum registro foi encontrado.','Atenção',48);
        end;



         pnlContratos.Caption := 'Contratos (' +  IntToStr(cdsContratos.RecordCount) + ')';

        
     FINALLY
       Screen.Cursor := crDefault;
     end;
end;

procedure TfrmControle_Atos_Gestao.FormCreate(Sender: TObject);
begin
  //Cria Instância do objeto
  CtrlControle_Atos_Gestao := TCtrlControle_Atos_Gestao.Create();
  CtrlControle_Atos_Gestao.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
  CtrlControle_Atos_Gestao.DataBase   := DtmBaseDados.dbBaseDados;
  cdsContratos_Expotacao.CreateDataSet;
  cdsContratos.IndexFieldNames := 'DATA_EVENTO';

end;

procedure TfrmControle_Atos_Gestao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //Destroí controle de exportação
     if CtrlControle_Atos_Gestao <> nil then
        FreeAndNil(CtrlControle_Atos_Gestao);
      cdsContratos_Expotacao.Close;  
end;

procedure TfrmControle_Atos_Gestao.btnenviarClick(Sender: TObject);
begin
     //MSG008
     if (Retornar_Selecionados = 0) then
     begin
       Application.MessageBox('Não existe contrato selecionado.','Atenção',48);
       Exit;
     end;

     TRY
       Screen.Cursor := crHourGlass;

       //Filtra somente selecionados em tela pelo usuário
       cdsContratos.DisableControls;
       cdsContratos.Filter := 'SEL = 1';
       cdsContratos.Filtered := True;

       CtrlControle_Atos_Gestao.Progresso   := Progresso;
       CtrlControle_Atos_Gestao.cdsContrato := cdsContratos;
       //Realizar o envio
       CtrlControle_Atos_Gestao.Enviar;

       //MSG009
       Application.MessageBox('Contrato(s) enviado(s) com sucesso.','Atenção',48);

     FINALLY
       Screen.Cursor := crDefault;
       cdsContratos.Filtered := false;
       cdsContratos.EnableControls;

       btnBuscar.Click();
     end;




end;

procedure TfrmControle_Atos_Gestao.btngerarClick(Sender: TObject);
var
  Bk:TBookmark;
  Index:string;
begin
     //MSG008
     if (Retornar_Selecionados = 0) then
     begin
       Application.MessageBox('Não existe contrato selecionado.','Atenção',48);
       Exit;
     end;

     Bk := cdsContratos.GetBookmark;
     Index :=  cdsContratos.IndexFieldNames;
     cdsContratos.First;

     TRY
           Screen.Cursor := crHourGlass;
           //cdsContratos.Filter := 'SEL = 1';
           //cdsContratos.Filtered := True;
           cdsContratos.DisableControls;

           cdsContratos_Expotacao.EmptyDataSet;

           while not cdsContratos.eof Do
           begin

                if cdsContratos.FieldByName('SEL').AsString = '1' then
                begin
                  with cdsContratos_Expotacao DO
                  begin
                    Append;
                    FieldByName('DATA_CONTRATO').AsDateTime := cdsContratos.FieldByName('DATA_CONTRATO').AsDateTime;
                    FieldByName('DATA_CONTRATO').DisplayLabel := cdsContratos.FieldByName('DATA_CONTRATO').DisplayLabel;
                    FieldByName('DATA_EVENTO').Asstring := cdsContratos.FieldByName('DATA_EVENTO').Asstring;
                    FieldByName('DATA_EVENTO').DisplayLabel := cdsContratos.FieldByName('DATA_EVENTO').DisplayLabel;
                    FieldByName('VALOR').Asstring := cdsContratos.FieldByName('VALOR').Asstring;
                    FieldByName('VALOR').DisplayLabel := cdsContratos.FieldByName('VALOR').DisplayLabel;
                    FieldByName('NOME_CONTRATO').Asstring := cdsContratos.FieldByName('NOME_CONTRATO').Asstring ;
                    FieldByName('NOME_CONTRATO').DisplayLabel := cdsContratos.FieldByName('NOME_CONTRATO').DisplayLabel;
                    FieldByName('NUMERO_CONTRATO').Asstring := cdsContratos.FieldByName('NUMERO_CONTRATO').Asstring;
                    FieldByName('NUMERO_CONTRATO').DisplayLabel := cdsContratos.FieldByName('NUMERO_CONTRATO').DisplayLabel;
                    FieldByName('HISTORICO').Asstring := cdsContratos.FieldByName('HISTORICO').Asstring;
                    FieldByName('HISTORICO').DisplayLabel := cdsContratos.FieldByName('HISTORICO').DisplayLabel;
                    FieldByName('TIPOCONTRATO').Asstring := cdsContratos.FieldByName('TIPOCONTRATO').Asstring;
                    FieldByName('TIPOCONTRATO').DisplayLabel := cdsContratos.FieldByName('TIPOCONTRATO').DisplayLabel;
                    Post;
                  end;
                end;

                cdsContratos.Next;
           end;

           qeExporta.Execute;
     FINALLY
            //cdsContratos.Filter   := '';
            //cdsContratos.Filtered := false;
            cdsContratos.GotoBookmark(Bk);

            cdsContratos.EnableControls;
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
     end;
end;

procedure TfrmControle_Atos_Gestao.btnimprimirClick(Sender: TObject);
begin
     //MSG008
     if (Retornar_Selecionados = 0) then
     begin
       Application.MessageBox('Não existe contrato selecionado.','Atenção',48);
       Exit;
     end;

     TRY
        Screen.Cursor := crHourGlass;
        cdsContratos.DisableControls;
        cdsContratos.Filter := 'SEL = 1';
        cdsContratos.Filtered := True;

        plblValor.Caption := cdsContratos.FieldByName('VALOR').DisplayLabel;

        //Impressão do Relatório
        ppRelat.AllowPrintToArchive := True;
        ppRelat.AllowPrintToFile := True;
        TFrmPreview.CreateModalPreview(frmControle_Atos_Gestao,ppRelat,'Atos de Gestão');

     FINALLY
        cdsContratos.Filtered := False;
        cdsContratos.EnableControls;
        Screen.Cursor := crDefault;
     end;
end;

procedure TfrmControle_Atos_Gestao.btn1Click(Sender: TObject);
begin
     //MSG008
     if cdsContratos.IsEmpty then
     begin
       Application.MessageBox('Não existe contrato selecionado.','Atenção',48);
       Exit;
     end;

     cdsContratos.First;
     cdsContratos.DisableControls;
     while not cdsContratos.eof Do
     begin
        cdsContratos.Edit;
        cdsContratos.FieldByName('SEL').AsInteger := 1;
        cdsContratos.post;
        cdsContratos.Next;
     end;

     cdsContratos.EnableControls;
     cdsContratos.First;
end;

procedure TfrmControle_Atos_Gestao.btn2Click(Sender: TObject);
begin
     //MSG008
     if cdsContratos.IsEmpty then
     begin
       Application.MessageBox('Não existe contrato selecionado.','Atenção',48);
       Exit;
     end;

     cdsContratos.First;
     cdsContratos.DisableControls;
     while not cdsContratos.eof Do
     begin
        cdsContratos.Edit;
        cdsContratos.FieldByName('SEL').AsInteger := 0;
        cdsContratos.post;
        cdsContratos.Next;
     end;

     cdsContratos.EnableControls;
     cdsContratos.First;

end;

function TfrmControle_Atos_Gestao.Retornar_Selecionados: integer;
var
   Bk:TBookmark;
begin
     TRY
        Result := 0;

        Bk := cdsContratos.GetBookmark;

        if cdsContratos.IsEmpty then Exit;

        cdsContratos.DisableControls;
        cdsContratos.Filter := 'SEL = 1';
        cdsContratos.Filtered := True;

        Result := cdsContratos.RecordCount;
     FINALLY
        cdsContratos.Filter := '';
        cdsContratos.Filtered := false;
        cdsContratos.GotoBookmark(Bk);
        cdsContratos.EnableControls;
     end;
end;

procedure TfrmControle_Atos_Gestao.ppFooterBand2BeforePrint(
  Sender: TObject);
begin
     if not cdsContratos.IsEmpty then
     plblTotalContrato.Caption := 'Total de Contratos: ' + IntToStr(cdsContratos.RecordCount);
end;

procedure TfrmControle_Atos_Gestao.Progresso(vParam: array of Variant);
begin
   case vParam[1] of
      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );
      1: frmProgresso.AndaFormProgresso(vParam[4]);
      2: frmProgresso.EscondeFormProgresso;
   end;

   Application.ProcessMessages;
   Repaint;     
end;

procedure TfrmControle_Atos_Gestao.FormShow(Sender: TObject);
begin
     dtpinicial.DateTime := Now - 1;
     dtpfinal.DateTime := Now;
end;

procedure TfrmControle_Atos_Gestao.dbgrdContratoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  if cdsContratos.Active then
  begin
     cdsContratos.IndexFieldNames := AFieldName;
     cdsContratos.EnableControls;
     Application.ProcessMessages();
  end;   
end;

procedure TfrmControle_Atos_Gestao.dbgrdContrato1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    Check: Integer;
    R: TRect;
begin
    //Desenha um checkbox no dbgrid
    if Column.FieldName = 'SEL' then
    begin
      dbgrdContrato1.Canvas.FillRect(Rect);
      Check := 0;

      if cdsContratos.FieldByName('Sel').AsString = '1' then
         Check := DFCS_CHECKED
      else
          Check := 0;

      R:=Rect;
      InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(dbgrdContrato1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);

    end;
end;

procedure TfrmControle_Atos_Gestao.dbgrdContrato1TitleClick(
  Column: TColumn);
begin
  if cdsContratos.Active then
  begin
     cdsContratos.IndexFieldNames := Column.FieldName;
     cdsContratos.EnableControls;
     Application.ProcessMessages();
  end; 
end;

procedure TfrmControle_Atos_Gestao.dbgrdContrato1CellClick(
  Column: TColumn);
begin
     if not cdsContratos.Active then Exit;
     if cdsContratos.IsEmpty    then Exit;
     
     cdsContratos.Edit;
     if cdsContratos.FieldByName('SEL').AsInteger = 0 then
        cdsContratos.FieldByName('SEL').AsInteger := 1
     else
        cdsContratos.FieldByName('SEL').AsInteger := 0;
     cdsContratos.post;
end;

end.
