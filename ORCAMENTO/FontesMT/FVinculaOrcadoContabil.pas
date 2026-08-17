{--------------------------------------------------------------------------------------------------
Rotina......: ListarContaContabilGruposOrcamen
Nº SOL......: 172383-9201
Nº KINTANA..: 1640405
Data........: 23/04/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Rotina........: *.DFM, btnVinculaonClick, btnAtualizaGruposonClick
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Todo o Formulário
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: TELA DE VINCULAÇÃO DE CONTAS CONTÁBEIS COM GRUPO ORCAMENTARIO
----------------------------------------------------------------------------------------------------}


unit FVinculaOrcadoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls,uCtrlPadroes,DBaseDados,USistema,
  Db, DBClient, uCMClientDataSet, ToolWin, wwdblook, CMDBLookupCombo;

type
  TfrmVinculaOrcadoContabil = class(TForm)
    pnlGruposOrcamen: TPanel;
    pnlOutros: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    lblGrupoorcamenContab: TLabel;
    GridGruposOrcamen: TwwDBGrid;
    GridGrupoOrcamenContab: TwwDBGrid;
    StatusBar: TStatusBar;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    cdsGrupoOrcamen: TCMClientDataSet;
    dsGrupoOrcamen: TDataSource;
    cdsGrupoorcamenContaContab: TClientDataSet;
    dsGrupoorcamenContaContab: TDataSource;
    CoolBar1: TCoolBar;
    pnlBottom: TPanel;
    btnVincula: TBitBtn;
    CoolBar2: TCoolBar;
    pnlTool: TPanel;
    Image1: TImage;
    cboBuscaGrupoOrcamen: TComboBox;
    edtBuscaGrupo: TEdit;
    pnlSintetico: TPanel;
    pnlAnalitico: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnAtualizaGrupos: TBitBtn;
    cdsPlanoOrc: TCMClientDataSet;
    Label23: TLabel;
    cboPlanoOrc: TCMDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridGruposOrcamenDblClick(Sender: TObject);
    procedure GridGruposOrcamenCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure GridGruposOrcamenTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GridGrupoOrcamenContabTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure btnVinculaClick(Sender: TObject);
    procedure edtBuscaGrupoChange(Sender: TObject);
    procedure GridGrupoOrcamenContabCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure btnAtualizaGruposClick(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaTela(cond:Boolean);
  public
    { Public declarations }
  end;

var
  frmVinculaOrcadoContabil: TfrmVinculaOrcadoContabil;

implementation

uses FVinculaOrcadoContabilDetalhe, uCtrlVinculaOrcadoContabil,
  FVinculaOrcadoAtualizacao;

{$R *.DFM}

procedure TfrmVinculaOrcadoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Destrói Controle
   FreeAndNil(CtrlVinculaOrcadoContabil);

   //Destrói Dataset
   cdsGrupoOrcamen.Close;
   
   //Fecha Form
   Action := caFree;
end;

procedure TfrmVinculaOrcadoContabil.FormCreate(Sender: TObject);
begin
     //Cria Controle
     CtrlVinculaOrcadoContabil := TCtrlVinculaOrcadoContabil.Create();
     CtrlVinculaOrcadoContabil.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlVinculaOrcadoContabil.DataBase   := DtmBaseDados.dbBaseDados;

     cdsGrupoOrcamen.Data := CtrlVinculaOrcadoContabil.ListarGruposOrcamen('','');
     cdsGrupoOrcamen.IndexFieldNames := 'CODGRUPOORC';

     // Edilaine - SOL 172383-7764 / KTN 1556975 - comentada
     cdsPlanoOrc.Data := CtrlVinculaOrcadoContabil.ListaPlanoOrcamento;

     StatusBar.Panels[0].Text := 'Total de Grupos: ' + IntToStr(cdsGrupoOrcamen.Recordcount);

     //Acerta controles
     cboBuscaGrupoOrcamen.ItemIndex := 0;
     edtBuscaGrupo.Clear;
     Application.ProcessMessages;
end;

procedure TfrmVinculaOrcadoContabil.GridGruposOrcamenDblClick(
  Sender: TObject);
begin
     //Lista Contas Contábeis do Grupo
     if not cdsGrupoOrcamen.Active then
        Exit;

     TRY
          Screen.Cursor := crHourGlass;
          pnlGruposOrcamen.Enabled := false;
          pnlOutros.Enabled := false;
          lblGrupoorcamenContab.Caption := 'Contas Contábeis Relacionados ao Grupo ' + cdsGrupoorcamen.fieldbyname('CODGRUPOORC').AsString;
          // Edilaine - SOL 172383-9201 / KTN 1640405
          //cdsGrupoorcamenContaContab.Data := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamen(cdsGrupoorcamen.fieldbyname('IDGRUPOORCAMEN').AsString);
          cdsGrupoorcamenContaContab.Data := CtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamen(cdsGrupoorcamen.fieldbyname('IDPLANOORCAMEN').AsString,
                                                                                                        cdsGrupoorcamen.fieldbyname('IDGRUPOORCAMEN').AsString);
          // Edilaine - SOL 172383-9201 / KTN 1640405 - FIM
          StatusBar.Panels[1].Text := 'Total Contas Contábeis: ' + IntToStr(cdsGrupoorcamenContaContab.Recordcount);
     FINALLY
          pnlGruposOrcamen.Enabled := true;
          pnlOutros.Enabled := true;
          Screen.Cursor := crDefault;
          Application.processMessages;
     END;
end;

procedure TfrmVinculaOrcadoContabil.GridGruposOrcamenCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if State <> [gdSelected] then
  begin
     if not Highlight then
     begin
          //Negrita a Linha para Grupos SIntéticos
          if trim(cdsGrupoOrcamen.Fieldbyname('FLGANALSINT_DESCRICAO').AsString) = 'Analítico' then
             ABrush.Color := pnlAnalitico.Color
          else
              ABrush.Color := pnlSintetico.Color;
     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmVinculaOrcadoContabil.GridGruposOrcamenTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
     if cdsGrupoOrcamen.Active then
        cdsGrupoOrcamen.IndexFieldNames := AFieldName;
end;

procedure TfrmVinculaOrcadoContabil.GridGrupoOrcamenContabTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
     if cdsGrupoorcamenContaContab.Active then
        cdsGrupoorcamenContaContab.IndexFieldNames := AFieldName;

end;

procedure TfrmVinculaOrcadoContabil.bbtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmVinculaOrcadoContabil.bbtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmVinculaOrcadoContabil.btnVinculaClick(Sender: TObject);
begin
     if cdsGrupoOrcamen.IsEmpty then
     begin
          Application.MessageBox('Favor selecionar um grupo orçamentário paara vincular.','Atenção',48);
          exit;
     end;

     // Edilaine - SOL 172383-7764 / KTN 1556975
     if (cboPlanoOrc.text = '') then
     begin
       Application.MessageBox('Obrigatório o preenchimento do Plano Orçamentário.','Atenção',48);
       cboPlanoOrc.setfocus;
       Exit;
     end;
     // Edilaine - SOL 172383-7764 / KTN 1556975 - fim


     TRY
        FrmVinculaOrcadoDetalhe := TFrmVinculaOrcadoDetalhe.Create(Application);
        FrmVinculaOrcadoDetalhe.IdGrupoOrcamen    := cdsGrupoorcamen.fieldbyname('IDGRUPOORCAMEN').AsInteger;
        FrmVinculaOrcadoDetalhe.CodGrupoOrcamen   := cdsGrupoorcamen.fieldbyname('CODGRUPOORC').AsString;
        FrmVinculaOrcadoDetalhe.DescrGrupoOrcamen := cdsGrupoorcamen.fieldbyname('NOMEGRUPOORCAMEN').AsString;
        FrmVinculaOrcadoDetalhe.idPlanoOrcamen    := cdsGrupoorcamen.fieldbyname('IDPLANOORCAMEN').AsInteger;
        FrmVinculaOrcadoDetalhe.DescrPlanoOrcamen := cdsGrupoorcamen.fieldbyname('NOMEPLANOORC').AsString;
        FrmVinculaOrcadoDetalhe.iAnoPlanoOrcamen  := cdsGrupoorcamen.fieldbyname('ANO').AsInteger;
        FrmVinculaOrcadoDetalhe.ShowModal;

        if FrmVinculaOrcadoDetalhe.ModalResult = mrOk then
        begin
             //Refaz Consulta
             GridGruposOrcamenDblClick(GridGruposOrcamen);
        end;   

     FINALLY
         FreeAndNil(FrmVinculaOrcadoDetalhe);
     END;

end;

procedure TfrmVinculaOrcadoContabil.edtBuscaGrupoChange(Sender: TObject);
var
   strcampo:string;
begin

   if not cdsGrupoOrcamen.Active then
      Exit;

   if cdsGrupoOrcamen.IsEmpty then
      Exit;

   strcampo := '';

   case cboBuscaGrupoOrcamen.ItemIndex of
        0: strcampo := 'CODGRUPOORC'; //Código da Conta
        1: strcampo := 'NOMEGRUPOORCAMEN';  //Descrição da Conta
   end;


   if (strcampo = '') then
      Exit;

   cdsGrupoOrcamen.IndexFieldNames := strcampo;
   cdsGrupoOrcamen.FindNearest([edtBuscaGrupo.text]);
end;

procedure TfrmVinculaOrcadoContabil.GridGrupoOrcamenContabCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin

  if State <> [gdSelected] then
  begin
     if not Highlight then
     begin
          //Negrita a Linha para Grupos SIntéticos
          if trim(cdsGrupoorcamenContaContab.Fieldbyname('PLATIPO').AsString) = 'A' then
             ABrush.Color := pnlAnalitico.Color
          else
              ABrush.Color := pnlSintetico.Color;
     end;
  end
  else
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;

end;

procedure TfrmVinculaOrcadoContabil.btnAtualizaGruposClick(Sender: TObject);
begin
     // Edilaine - SOL 172383-7764 / KTN 1556975
     if (cboPlanoOrc.Text = '')  then
     begin
       Application.MessageBox('Obrigatório o preenchimento do Plano Orçamentário.','Atenção',48);
       cboPlanoOrc.setfocus;
       Exit;
     end;
     // Edilaine - SOL 172383-7764 / KTN 1556975 - fim


     TRY
       if Application.MessageBox(PChar('Deseja realmente atualizar todos os grupos orçamentários?' + #13 +
                                       'Este processo será demorado pois atualizará ' + IntToStr(cdsGrupoOrcamen.recordcount)
                                       +  ' grupo(s) orçamentários.' + #13),'Atenção',36) = 6 then
       begin
            HabilitaTela(false);

            //Inicia Atualização em massa dos Grupos Orçamentálrios
            TRY
              FrmVinculaOrcadoAtualizacao := TFrmVinculaOrcadoAtualizacao.Create(Application);
              FrmVinculaOrcadoAtualizacao.ShowModal();
            FINALLY
              FreeAndNil(FrmVinculaOrcadoAtualizacao);
            END;
       end;
     FINALLY
       HabilitaTela(true);
     end;
end;

procedure TfrmVinculaOrcadoContabil.HabilitaTela(cond: Boolean);
begin
     TRY
       if cond then
       begin
          cdsGrupoOrcamen.EnableControls;
          cdsGrupoorcamenContaContab.EnableControls;
       end
       else
       begin
          cdsGrupoOrcamen.DisableControls;
          cdsGrupoorcamenContaContab.DisableControls;
       end;

       pnlOutros.Visible              := cond;
       lblGrupoorcamenContab.Visible  := cond;
       pnlBottom.Visible              := cond;
       pnlTool.Visible                := cond;
       GridGruposOrcamen.Visible      := cond;
       GridGrupoOrcamenContab.Visible := cond;
     FINALLY
       Application.ProcessMessages;
     end;
end;


procedure TfrmVinculaOrcadoContabil.cboPlanoOrcChange(Sender: TObject);
var
   strcampo:string;
begin
   // Edilaine - SOL 172383-7764 / KTN 1556975
   if not cdsGrupoOrcamen.Active then
      Exit;

   if cdsGrupoOrcamen.IsEmpty then
      Exit;

   cdsGrupoOrcamen.Filtered := false;
   cdsGrupoOrcamen.Filter   := '';
   if cboPlanoOrc.Text <> '' then
   begin
     cdsGrupoOrcamen.Filter   := 'IDPLANOORCAMEN = '+Quotedstr(cboPlanoOrc.LookupValue);
     cdsGrupoOrcamen.Filtered := true;
   end;

   strcampo := '';

   case cboBuscaGrupoOrcamen.ItemIndex of
        0: strcampo := 'CODGRUPOORC'; //Código da Conta
        1: strcampo := 'NOMEGRUPOORCAMEN';  //Descrição da Conta
   end;

   if (strcampo = '') then
      Exit;

   cdsGrupoOrcamen.IndexFieldNames := strcampo;
   cdsGrupoOrcamen.FindNearest([edtBuscaGrupo.text]);
   // Edilaine - SOL 172383-7764 / KTN 1556975
end;


end.
