unit FCadMontaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  fcTreeView, DBCtrls, Mask, wwdbedit, ComCtrls, CMTree, Grids, Wwdbigrd,
  Wwdbgrid, DBTables, Wwquery, Provider, uCtrlMontaFluxo, uCMTreeViewMT,
  uCtrlListTercFinanc {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
  TFrmCadMontaFluxoMT = class(TFrmCadastroMT)
    PgcMontaFluxo: TPageControl;
    tbshCadastro: TTabSheet;
    lblDescricao: TLabel;
    pnlComposicaoLinhas: TPanel;
    btnIncluirComposicao: TSpeedButton;
    btnExcluirComposicao: TSpeedButton;
    dbgSelecionados: TwwDBGrid;
    pnlTituloDisponiveis: TPanel;
    dbgLinhas: TwwDBGrid;
    dbeDescricao: TwwDBEdit;
    dbrgTipoCalculo: TDBRadioGroup;
    gbAcumula: TGroupBox;
    dbcAcumula: TDBCheckBox;
    dbrgPosicaoTotal: TDBRadioGroup;
    tbshMapaFluxo: TTabSheet;
    TrvMapaFluxo: TfcTreeView;
    CdsComposicaoLinha: TCMClientDataSet;
    cdsTiposRD: TCMClientDataSet;
    dsTiposRD: TwwDataSource;
    dbgTiposDocumento: TwwDBGrid;
    dsComposicaoLinha: TwwDataSource;
    pnlTituloSelecionados: TPanel;
    cdsTiposDocumento: TCMClientDataSet;
    dsTiposDocumento: TwwDataSource;
    TrvTiposRD: TfcTreeView;
    cdsLinhasFluxo: TCMClientDataSet;
    dsLinhasFluxo: TwwDataSource;
    cdsLinhasFluxoCODLINHAFLUXO: TFloatField;
    cdsLinhasFluxoDESCRICAO: TStringField;
    ToolbarSep972: TToolbarSep97;
    bbtnVerificar: TBitBtn;
    sbtnOrdenar: TToolbarButton97;
    cdsMapaFluxo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure dbrgTipoCalculoClick(Sender: TObject);
    procedure btnIncluirComposicaoClick(Sender: TObject);
    procedure btnExcluirComposicaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure TrvTiposRDChanging(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var AllowChange: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnVerificarClick(Sender: TObject);
    procedure sbtnOrdenarClick(Sender: TObject);
  private
    { Private declarations }
    sMascaraCap : String;
    sMascaraCar : String;
    CtrlMontaFluxo : TCtrlMontaFluxo;
    CtrlListTerceiros : TCtrlListTercFinanc;
    procedure MontaTreeViewTRD;
    procedure MontaTreeViewMapaFluxo;
  public
    { Public declarations }
  end;

var
  FrmCadMontaFluxoMT: TFrmCadMontaFluxoMT;

implementation

uses dBaseDados, uSistema, uMensErro, FVerificaFluxoMT, FOrdenaFluxoMT;

{$R *.DFM}

procedure TFrmCadMontaFluxoMT.FormCreate(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   inherited;
   MontaSelect.Filtro.Add('(IDPESSOA='+IntToStr(Sistema.IdEmpresa)+')');

   //Inicializa CtrlMontaFluxo
   CtrlMontaFluxo:=TCtrlMontaFluxo.Create;
   CtrlMontaFluxo.Initialize(dtmBaseDados.dbBaseDados,True);
   //Associa ClientDataSets
   CtrlMontaFluxo.CdsMontaFluxo:=Cds;
   CtrlMontaFluxo.CdsCompFluxo:=CdsComposicaoLinha;

   //Abre cds sem Dados
   Cds.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,-1,False); //vazio

   //Abre cds de Composição de Linha de Fluxo sem Dados
   CdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(-1,-1);

   //Carrega cds de Linhas de Fluxo
   cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,0,False);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds de Tipos de Documento
   cdsTiposDocumento.Data:=CtrlListTerceiros.ListTipDocXCompFluxoDisp;

   //Carrega cds de Tipos de Rec/Des
   cdsTiposRD.Data:=CtrlListTerceiros.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,False);

   dbgLinhas.BringToFront;

   cdsAux:=TCMClientDataSet.Create(nil);
   cdsAux.Data:=CtrlListTerceiros.ListParamCAP(Sistema.IdEmpresa,'');
   try
      cdsAux.Filtered:=False;
      cdsAux.Filter:='RECPAG=''R''';
      cdsAux.Filtered:=True;
      sMascaraCar:=cdsAux.FieldByName('MASCARADESEMB').AsString;
      cdsAux.Filtered:=False;
      cdsAux.Filter:='RECPAG=''P''';
      cdsAux.Filtered:=True;
      sMascaraCap:=cdsAux.FieldByName('MASCARADESEMB').AsString;
      cdsAux.Close;
   finally
      cdsAux.Free;
   end;

   PgcMontaFluxo.ActivePageIndex:=1;
   MontaTreeViewMapaFluxo;
   PgcMontaFluxo.ActivePageIndex:=0;
end;

procedure TFrmCadMontaFluxoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlMontaFluxo.Free;
   CtrlListTerceiros.Free;
end;

procedure TFrmCadMontaFluxoMT.dbrgTipoCalculoClick(Sender: TObject);
begin
   pnlComposicaoLinhas.Visible:=True;
   dbcAcumula.Enabled:=True;
   dbrgPosicaoTotal.Enabled:=True;

   case dbrgTipoCalculo.ItemIndex of
      0,1 : begin
               pnlTituloDisponiveis.Font.Size:=14;
               pnlTituloSelecionados.Font.Size:=14;
               pnlTituloDisponiveis.Caption:='Tipos Possíveis';
               pnlTituloSelecionados.Caption:='Tipos Selecionados';
               TrvTiposRD.BringToFront;

               if dbrgTipoCalculo.ItemIndex=0 then
                begin
                   //Filtra os Tipos de Recebimento Possíveis
                   cdsTiposRD.Filtered:=False;
                   cdsTiposRD.Filter:='RECPAG = ''R''';
                   cdsTiposRD.Filtered:=True;
                end
               else
                begin
                   //Filtra os Tipos de Desembolso Possíveis
                   cdsTiposRD.Filtered:=False;
                   cdsTiposRD.Filter:='RECPAG = ''P''';
                   cdsTiposRD.Filtered:=True;
                end;
               MontaTreeViewTRD;
            end;
      2,3 : begin
               pnlTituloDisponiveis.Font.Size:=10;
               pnlTituloSelecionados.Font.Size:=10;
               pnlTituloDisponiveis.Caption:='Tipos de Documento Possíveis';
               pnlTituloSelecionados.Caption:='Tipos de Documento Selecionados';
               dbgTiposDocumento.BringToFront;

               if dbrgTipoCalculo.ItemIndex=2 then
                begin
                   //Filtra os Tipos de Documento de Recebimento Possíveis
                   cdsTiposDocumento.Filtered:=False;
                   cdsTiposDocumento.Filter:='RECPAG = ''R''';
                   cdsTiposDocumento.Filtered:=True;
                end
               else
                begin
                   //Filtra os Tipos de Documento de Desembolso Possíveis
                   cdsTiposDocumento.Filtered:=False;
                   cdsTiposDocumento.Filter:='RECPAG = ''P''';
                   cdsTiposDocumento.Filtered:=True;
                end;
            end;
        4 : begin
               pnlTituloDisponiveis.Font.Size:=14;
               pnlTituloSelecionados.Font.Size:=14;
               pnlTituloDisponiveis.Caption:='Linhas Possíveis';
               pnlTituloSelecionados.Caption:='Linhas Selecionadas';
               dbgLinhas.BringToFront;
            end;
        5 : begin
               pnlComposicaoLinhas.Visible:=False;
               dbcAcumula.Enabled:=False;
               dbrgPosicaoTotal.Enabled:=False;
            end;
   end;
end;

procedure TFrmCadMontaFluxoMT.btnIncluirComposicaoClick(Sender: TObject);
begin
   case dbrgTipoCalculo.ItemIndex of
      0,1 : begin
               if not(cdsTiposRD.IsEmpty) then
                begin
                   CdsComposicaoLinha.Insert;
                   CdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
                   CdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString:=
                                      cdsTiposRD.FieldByName('CODTIPRECDES').AsString;
                   CdsComposicaoLinha.FieldByName('RECPAG').AsString:=
                                      cdsTiposRD.FieldByName('RECPAG').AsString;
                   CdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                      cdsTiposRD.FieldByName('DESCRICAO').AsString;
                   CdsComposicaoLinha.FieldByName('CodLinhaFluxo').AsFloat:=
                                      Cds.FieldByName('CodLinhaFluxo').AsFloat;
                   CdsComposicaoLinha.Post;
                   dbrgTipoCalculo.Enabled:=False;
                end;
            end;
      2,3 : begin
               if cdsTiposDocumento.IsEmpty then Exit;

               CdsComposicaoLinha.Insert;
               CdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
               CdsComposicaoLinha.FieldByName('CODTIPDOC').AsString:=
                                  cdsTiposDocumento.FieldByName('CODTIPDOC').AsString;
               CdsComposicaoLinha.FieldByName('RECPAG').AsString:=
                                  cdsTiposDocumento.FieldByName('RECPAG').AsString;
               CdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                  cdsTiposDocumento.FieldByName('DESCRICAO').AsString;
               CdsComposicaoLinha.FieldByName('CodLinhaFluxo').AsFloat:=
                                  Cds.FieldByName('CodLinhaFluxo').AsFloat;
               CdsComposicaoLinha.Post;

               cdsTiposDocumento.Delete;
               dbrgTipoCalculo.Enabled:=False;
            end;
        4 : begin
               if cdsLinhasFluxo.IsEmpty then Exit;

               CdsComposicaoLinha.Insert;
               CdsComposicaoLinha.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
               CdsComposicaoLinha.FieldByName('CODCOMPLINHA').AsFloat:=
                                  cdsLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat;
               CdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                  cdsLinhasFluxo.FieldByName('DESCRICAO').AsString;
               CdsComposicaoLinha.FieldByName('CodLinhaFluxo').AsFloat:=
                                  Cds.FieldByName('CodLinhaFluxo').AsFloat;
               CdsComposicaoLinha.Post;

               cdsLinhasFluxo.Delete;
               dbrgTipoCalculo.Enabled:=False;               
            end;
   end;
end;

procedure TFrmCadMontaFluxoMT.btnExcluirComposicaoClick(Sender: TObject);
begin
   case dbrgTipoCalculo.ItemIndex of
      0,1 : if not(CdsComposicaoLinha.IsEmpty) then
             begin

                cdsTiposRD.Insert;
                cdsTiposRD.FieldByName('CODTIPRECDES').AsString:=
                                   CdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString;
                cdsTiposRD.FieldByName('RECPAG').AsString:=
                                   CdsComposicaoLinha.FieldByName('RECPAG').AsString;
                cdsTiposRD.FieldByName('DESCRICAO').AsString:=
                                   CdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
                cdsTiposRD.Post;

                CdsComposicaoLinha.Delete;
                dbrgTipoCalculo.Enabled:=(CdsComposicaoLinha.IsEmpty);

                MontaTreeViewTRD;
             end;
      2,3 : begin
               if CdsComposicaoLinha.IsEmpty then Exit;

               cdsTiposDocumento.Insert;
               cdsTiposDocumento.FieldByName('CODTIPDOC').AsString:=
                          CdsComposicaoLinha.FieldByName('CODTIPDOC').AsString;
               cdsTiposDocumento.FieldByName('RECPAG').AsString:=
                          CdsComposicaoLinha.FieldByName('RECPAG').AsString;
               cdsTiposDocumento.FieldByName('DESCRICAO').AsString:=
                          CdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
               cdsTiposDocumento.Post;

               CdsComposicaoLinha.Delete;
               dbrgTipoCalculo.Enabled:=(CdsComposicaoLinha.IsEmpty);
            end;
        4 : begin
               if CdsComposicaoLinha.IsEmpty then Exit;
                       
               cdsLinhasFluxo.Insert;
               cdsLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat:=
                                  CdsComposicaoLinha.FieldByName('CODCOMPLINHA').AsFloat;
               cdsLinhasFluxo.FieldByName('DESCRICAO').AsString:=
                                  CdsComposicaoLinha.FieldByName('DESCLINHA').AsString;
               cdsLinhasFluxo.Post;

               CdsComposicaoLinha.Delete;
               dbrgTipoCalculo.Enabled:=(CdsComposicaoLinha.IsEmpty);
            end;
   end;
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       //Carrega cds 
       if Cds.Active then Cds.Close;

       Cds.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,
                                               StrToFloat(MontaSelect.ValoresChave[0]),
                                               False);

       //Carrega cds de Composição das linhas de Fluxo
       if CdsComposicaoLinha.Active then CdsComposicaoLinha.Close;
       CdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(Sistema.IdEmpresa,
                                               StrToFloat(MontaSelect.ValoresChave[0]));

       //Atualiza cds de Linhas de Fluxo
       cdsLinhasFluxo.Close;
       cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,
                                                          StrToFloat(MontaSelect.ValoresChave[0]),True);

       //Atualiza cds de Tipos de Rec/Des
       cdsTiposRD.Data:=CtrlListTerceiros.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,False);

       dbrgTipoCalculoClick(nil);
    end;
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   if (Trim(dbeDescricao.Text) = '') and (CmeCadastro.Operacao<>opApagar) then
    begin
       MsgDlg('Obrigatório preencher a Descrição da Linha de Fluxo','Erro',mtError,[mbOK],0);
       dbeDescricao.SetFocus;
       Accept:=False;
    end;
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   case dbrgTipoCalculo.ItemIndex of
      0,1: begin
              cdsTiposRD.Close;
              //Carrega cds de Tipos de Rec/Des
              cdsTiposRD.Data:=CtrlListTerceiros.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,False);
              MontaTreeViewTRD;
           end;
      2,3: begin
              cdsTiposDocumento.Close;
              cdsTiposDocumento.Data:=CtrlListTerceiros.ListTipDocXCompFluxoDisp;
           end;
   end;

   //Carrega cds de Linhas de Fluxo
   cdsLinhasFluxo.Close;
   cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,0,False);

   MontaTreeViewMapaFluxo;
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if (CtrlMontaFluxo.MessageInfo<>'') then
      MsgDlg(CtrlMontaFluxo.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   CdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(Sistema.IdEmpresa,
                                           Cds.FieldByName('CodLinhaFluxo').AsFloat);
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   Cds.FieldByName('FLGACUMULA').AsString:='N';
   Cds.FieldByName('POSICAOTOTAL').AsString:='I';

   //Carrega cds de Linhas de Fluxo
   if cdsLinhasFluxo.Active then cdsLinhasFluxo.Close;
   cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,0,False);
   //Abre cds de Composição de Linha de Fluxo sem Dados
   CdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(-1,-1);
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMontaFluxo.IncluiAlteraFluxo(Sistema.IdEmpresa,
                                            Sistema.IdModulo,
                                            Sistema.IdUsuario);
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMontaFluxo.IncluiAlteraFluxo(Sistema.IdEmpresa,
                                            Sistema.IdModulo,
                                            Sistema.IdUsuario);
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMontaFluxo.ExcluiFluxo(Sistema.IdEmpresa,
                                      Sistema.IdModulo,
                                      Sistema.IdUsuario);
   //Carrega cds de Linhas de Fluxo
   cdsLinhasFluxo.Close;
   cdsLinhasFluxo.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,0,False);

   MontaTreeViewMapaFluxo;
end;

procedure TFrmCadMontaFluxoMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   dbrgTipoCalculo.Enabled:=not(sbtnAlterar.Down);
   sbtnOrdenar.Enabled:=True;
   if (sbtnInserir.Down = True) or (sbtnAlterar.Down = True) or (sbtnApagar.Down = True) then
      sbtnOrdenar.Enabled:=False;
   bbtnVerificar.Enabled:=not((sbtnInserir.Down = True) or (sbtnAlterar.Down = True) or (sbtnApagar.Down = True));

   tbshCadastro.Enabled:=pnlFundo.Enabled;
   tbshMapaFluxo.Enabled:=True;
   PgcMontaFluxo.ActivePageIndex:=0;
   pnlFundo.Enabled:=True;

end;

procedure TFrmCadMontaFluxoMT.sbtnOrdenarClick(Sender: TObject);
begin
   with TfrmOrdenaFluxoMT.Create(Self) do
   try
      ShowModal;
   finally
      Free;
   end;
   MontaTreeViewMapaFluxo;
   sbtnOrdenar.Down:=False;
end;

procedure TFrmCadMontaFluxoMT.bbtnVerificarClick(Sender: TObject);
var
   sTipoAux    : String;
   iModoAux    : Integer;
   iTipoFalta  : Integer;
   bCancelado  : Boolean;
   bErro       : Boolean;
   cdsAux      : TClientDataSet;
begin
   iModoAux:=0;
   bCancelado:=False;

   cdsAux:=TClientDataSet.Create(nil);
   try
      //Carrega cdsAux (vazio)
      cdsAux.Data:=CtrlMontaFluxo.ListFaltantes;

      with TfrmVerificaFluxoMT.Create(Self) do
      try
         if (ShowModal = mrOk) and (iNumMarcados<>0) then
          begin
             sTipoAux:=sTipo;
             iModoAux:=rgModoInclusao.ItemIndex;
             iTipoFalta:=rgFaltantes.ItemIndex;

             CdsTRDFaltantes.First;
             while not(CdsTRDFaltantes.Eof) do
             begin
                if (CdsTRDFaltantes.FieldByName('SELECIONADO').AsString='S') Then
                 begin
                    cdsAux.Insert;
                    cdsAux.FieldByName('RECPAG').AsString:=
                                          CdsTRDFaltantes.FieldByName('RECPAG').AsString;
                    cdsAux.FieldByName('DESCRICAO').AsString:=
                                          CdsTRDFaltantes.FieldByName('DESCRICAO').AsString;
                    cdsAux.FieldByName('CODIGO').AsString:=
                                          CdsTRDFaltantes.FieldByName('CODIGO').AsString;
                    cdsAux.Post;
                    Dec(iNumMarcados);
                 end;

                if iNumMarcados=0 then Break;

                CdsTRDFaltantes.Next;
             end;
          end
         else
          bCancelado:=True;
      finally;
         Free;
      end;

      if bCancelado then Exit;

      case iModoAux of
         0: begin
               //Tipos de Rec/Des em Nova Linha
               sbtnInserir.Click;
               case iTipoFalta of
                  0: if sTipoAux='R' then
                        dbrgTipoCalculo.ItemIndex:=0
                     else
                        dbrgTipoCalculo.ItemIndex:=1;
                  1: if sTipoAux='C' then
                        dbrgTipoCalculo.ItemIndex:=2
                     else
                        dbrgTipoCalculo.ItemIndex:=3;
               end;
            end;

         1: begin
               //Tipos de Rec/Des em Linha já existente
               bErro:=True;
               while bErro do
               begin
                  sbtnProcurar.Click;
                  if (MontaSelect.RetornouValor) then
                   begin
                      //Carrega cds
                      if Cds.Active then Cds.Close;
                      Cds.Data:=CtrlMontaFluxo.ListMontaFluxo(Sistema.IdEmpresa,
                                                              StrToFloat(MontaSelect.ValoresChave[0]),
                                                              False);
                      //Carrega cds de Composição das linhas de Fluxo
                      if CdsComposicaoLinha.Active then CdsComposicaoLinha.Close;
                      CdsComposicaoLinha.Data:=CtrlMontaFluxo.ListCompFluxo(Sistema.IdEmpresa,
                                                              StrToFloat(MontaSelect.ValoresChave[0]));
                      dbrgTipoCalculoClick(nil);

                      if ((cds.FieldByName('TIPOCALCULO').AsString='R') and (sTipoAux='R')) or
                         ((cds.FieldByName('TIPOCALCULO').AsString='P') and (sTipoAux='P')) or
                         ((cds.FieldByName('TIPOCALCULO').AsString='C') and (sTipoAux='C')) or
                         ((cds.FieldByName('TIPOCALCULO').AsString='D') and (sTipoAux='D')) then
                       begin
                          bErro:=False;
                          bCancelado:=False;
                          sbtnAlterar.Click;
                       end
                      else
                       begin
                          MsgDlg('Linha Incompatível com os tipos de Recebimento/Desembolso '+
                                 #10+#13+'selecionados.','Erro',mtError,[mbOk],0);
                           bErro:=True;
                           bCancelado:=False;
                       end;
                   end
                  else
                   begin
                      bErro:=False;
                      bCancelado:=True;
                   end;
               end;
            end;
      end;

      if not(bCancelado) then
       begin
          cdsAux.First;
          while not(cdsAux.Eof) do
          begin
             CdsComposicaoLinha.Insert;
             CdsComposicaoLinha.FieldByName('RECPAG').AsString:=
                                   cdsAux.FieldByName('RECPAG').AsString;
             CdsComposicaoLinha.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
             CdsComposicaoLinha.FieldByName('DESCLINHA').AsString:=
                                   cdsAux.FieldByName('DESCRICAO').AsString;
             if (cdsAux.FieldByName('RECPAG').AsString='R') or
                (cdsAux.FieldByName('RECPAG').AsString='P') then
                CdsComposicaoLinha.FieldByName('CODTIPRECDES').AsString:=
                                   cdsAux.FieldByName('CODIGO').AsString
             else
                CdsComposicaoLinha.FieldByName('CODTIPDOC').AsFloat:=
                                   cdsAux.FieldByName('CODIGO').AsFloat;

             CdsComposicaoLinha.FieldByName('CODLINHAFLUXO').AsFloat:=
                                   cds.FieldByName('CODLINHAFLUXO').AsFloat;
             CdsComposicaoLinha.Post;
             cdsAux.Next;
          end;
       end;

      cdsAux.Close;
   finally
      cdsAux.Free;
   end;
end;

//=============================================
// Rotinas do TreeView TRD
//=============================================

procedure TFrmCadMontaFluxoMT.TrvTiposRDChanging(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode;
  var AllowChange: Boolean);
var
   sTipoRD  : String;
   iPosicao : Integer;
begin
   sTipoRD:=Copy(Trim(Node.Text),1,Pos(' ',Trim(Node.Text))-1);
   iPosicao:= Pos('.',sTipoRD);
   while iPosicao<>0 do
   begin
      sTipoRD:=Copy(sTipoRD,1,iPosicao-1)+Copy(sTipoRD,iPosicao+1,Length(sTipoRD)-iPosicao);
      iPosicao:= Pos('.',sTipoRD);
   end;
   cdsTiposRD.Locate('CODTIPRECDES',sTipoRD,[loCaseInsensitive]);
end;

procedure TFrmCadMontaFluxoMT.MontaTreeViewTRD;
var
   Grupo        : array [1..50] of TfcTreeNode;
   sRadical     : array [1..50] of String;
   iNo          : Integer;
   mskedMascara : TMaskEdit;
   bMesmoGrupo  : Boolean;
   bInicio      : Boolean;
begin

   cdsTiposRD.DisableControls;
   mskedMascara:=TMaskEdit.Create(Self);
   try
      TrvTiposRD.Items.Clear;
      if cdsTiposRD.IsEmpty then Exit;

      //Formata o Tipo de R/D
      if cdsTiposRD.FieldByName('RECPAG').AsString='R' then
         mskedMascara.EditMask:=sMascaraCAR+';0; '
      else
         mskedMascara.EditMask:=sMascaraCAP+';0; ';

      bInicio:=True;
      cdsTiposRD.First;
      iNo:=0;
      while not(cdsTiposRD.Eof) do
      begin

         //Exibe Primeiro Registro
         if bInicio then
          begin
             iNo:=1;
             sRadical[iNo]:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);
             mskedMascara.Text:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);
             Grupo[iNo]:=TrvTiposRD.Items.Add(nil,
                         mskedMascara.EditText+' - '+cdsTiposRD.FieldByName('DESCRICAO').AsString);
             cdsTiposRD.Next;
             if (cdsTiposRD.Eof) then Break;
             bInicio:=False;
          end;

         mskedMascara.Text:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);

         //Testa se o Registro Corrente faz parte da mesma família do TRD anterior
         if Pos(sRadical[iNo],Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString))=1 then
          begin
             Inc(iNo);
             sRadical[iNo]:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);
             Grupo[iNo]:=TrvTiposRD.Items.AddChild(Grupo[iNo-1],
                  mskedMascara.EditText+' - '+cdsTiposRD.FieldByName('DESCRICAO').AsString);
          end
         else
          begin
             //Testa se o Registro faz parte de alguma família de TRDs anteriores
             bMesmoGrupo:=False;
             while not(bMesmoGrupo) do
             begin
                Dec(iNo);
                if (iNo<1) then  //Caso não faça parte de nenhuma família inicia a sua própria
                 begin
                    iNo:=1;
                    bMesmoGrupo:=True;
                    sRadical[iNo]:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);
                    Grupo[iNo]:=TrvTiposRD.Items.Add(nil,
                         mskedMascara.EditText+' - '+cdsTiposRD.FieldByName('DESCRICAO').AsString);
                 end
                else
                 if Pos(sRadical[iNo],Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString))=1 then
                 begin
                    bMesmoGrupo:=True;
                    Inc(iNo);
                    sRadical[iNo]:=Trim(cdsTiposRD.FieldByName('CODTIPRECDES').AsString);
                    Grupo[iNo]:=TrvTiposRD.Items.AddChild(Grupo[iNo-1],
                         mskedMascara.EditText+' - '+cdsTiposRD.FieldByName('DESCRICAO').AsString);
                 end;
             end;
          end;

         cdsTiposRD.Next;
      end;
   finally
      mskedMascara.Free;
      cdsTiposRD.EnableControls;
   end;
end;

procedure TFrmCadMontaFluxoMT.MontaTreeViewMapaFluxo;
var
   sLinhaFluxoAnt : String;
   rGrupoAnterior : Double;
   Grupo          : array [1..100] of TfcTreeNode;
   iIndice        : Integer;
   sRadical       : array [1..100] of String;
   mskedMascara   : TMaskEdit;
begin
   mskedMascara:=TMaskEdit.Create(Self);
   try
      cdsMapaFluxo.Close;
      cdsMapaFluxo.Data:=CtrlMontaFluxo.ListMapaFluxo(Sistema.IdEmpresa);

      if cdsMapaFluxo.IsEmpty then
       begin
          cdsMapaFluxo.Close;
          Exit;
       end;

      cdsMapaFluxo.First;

      TrvMapaFluxo.Visible:=False;
      TrvMapaFluxo.Items.Clear;

      while not(cdsMapaFluxo.Eof) do
      begin
         //Inclui linha do Fluxo
         Grupo[1]:=TrvMapaFluxo.Items.Add(nil,cdsMapaFluxo.FieldByName('LinhaFluxo').AsString);

         //Inclui linhas que compoem a linha do Fluxo
         sLinhaFluxoAnt:=cdsMapaFluxo.FieldByName('LinhaFluxo').AsString;
         while (cdsMapaFluxo.FieldByName('LinhaFluxo').AsString=sLinhaFluxoAnt) and
               not(cdsMapaFluxo.Eof) do
         begin
            iIndice:=1;
            rGrupoAnterior:=cdsMapaFluxo.FieldByName('Grupo').AsFloat;
            sRadical[iIndice]:=Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString);
            while ((rGrupoAnterior=cdsMapaFluxo.FieldByName('Grupo').AsFloat) and
                  (cdsMapaFluxo.FieldByName('LinhaFluxo').AsString=sLinhaFluxoAnt) and 
                   not(cdsMapaFluxo.Eof))do
            begin
               case cdsMapaFluxo.FieldByName('TIPOLINHA').AsInteger of
                  0: if Trim(cdsMapaFluxo.FieldByName('TIPORECDES').AsString)<>'' then
                      begin
                         if Length(sRadical[iIndice])<
                            Length(Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString)) then
                          begin
                             Inc(iIndice);
                             sRadical[iIndice]:=Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString);
                          end;

                         if cdsMapaFluxo.FieldByName('RECPAG').AsString='R' then
                            mskedMascara.EditMask:=sMascaraCAR+';0; '
                         else
                            mskedMascara.EditMask:=sMascaraCAP+';0; ';

                         mskedMascara.Text:=Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString);

                         if Trim(cdsMapaFluxo.FieldByName('CODTIPRECDES').AsString)='' then
                            Grupo[iIndice+1]:=TrvMapaFluxo.Items.AddChild(Grupo[iIndice],
                                                 cdsMapaFluxo.FieldByName('TIPORECDES').AsString)
                         else
                            Grupo[iIndice+1]:=TrvMapaFluxo.Items.AddChild(Grupo[iIndice],
                                                 mskedMascara.EditText+' - '+
                                                 cdsMapaFluxo.FieldByName('TIPORECDES').AsString);
                      end;

                   1: Grupo[2]:=TrvMapaFluxo.Items.AddChild(Grupo[1],
                                   FormatFloat('#####',cdsMapaFluxo.FieldByName('CODTIPDOC').AsFloat)+
                                   ' - '+cdsMapaFluxo.FieldByName('TIPODOC').AsString);
               end;

               cdsMapaFluxo.Next;
            end;
         end;
      end;
      //
      TrvMapaFluxo.Visible:=True;
      cdsMapaFluxo.Close;
   finally
      mskedMascara.Free;
   end;
end;

end.
