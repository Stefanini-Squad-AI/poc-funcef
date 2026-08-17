unit fQuadroAviso;

// -----------------------------------------------------------------------------
//
//      QUADRO DE AVISOS  ( MT )
//
//      Módulo          :  AdminImob
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  12/06/2003
//      Data de Término :  13/06/2003
//
// -----------------------------------------------------------------------------
//     23/12/2003 - Modificações - Marcio
//     Modificada a funçao VerificaCobrança devido a data de carência
//------------------------------------------------------------------------------
// Pendência  : 17959
// Autor      : Vinícius Meyer Lana
// Data       : 06/12/2004
// Descrição  : Alteração da query de abertura do quadro, buscando os parâmetros
//              na tabela AvisoImob e incluindo Evento Programado
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  Grids, Wwdbigrd, Wwdbgrid, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppVar, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppTypes, uCtrlContratoImovel, uCtrlLancamentosImovel, uCtrlAvisoImob,
  ImgList, fPreview;

type
  TfrmQuadroAviso = class(TfrmSairAjuda)
    dbgrdAviso: TwwDBGrid;
    dsAvisos: TDataSource;
    cdsAvisos: TCMClientDataSet;
    sqlAvisos: TCMSqlParams;
    btnImprimir: TBitBtn;
    rptAvisos: TppReport;
    pplAvisos: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ImlTitle: TImageList;
    btnCheck: TBitBtn;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLogoQuadroAviso: TppImage;
    procedure dbgrdAvisoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdAvisoDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbgrdAvisoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdAvisoTopRowChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdAvisoCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure btnCheckClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlAvisoImob      : TCtrlAvisoImob;

    sCampoOrdem : String;
    bOrdemAsc   : Boolean;

    procedure MontaIndices;
    procedure VerificaCobranca;
  public
    { Public declarations }
  end;

var
  frmQuadroAviso: TfrmQuadroAviso;

implementation

uses uSistema, dBaseDados, uMensErro, uComunsImobiliario, fCadContratoImovelMT,
     fCadSeguroImovelMT, uModuloImobiliario,
     // 2 camadas:
     uFuncoesImob, dImobiliario, fProgresso, FPrincipal, fExibeEvento;

{$R *.DFM}

procedure TfrmQuadroAviso.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlAvisoImob      := TCtrlAvisoImob.Create;
  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );
  CtrlContratoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);
  CtrlAvisoImob.InitializeAs( CtrlContratoImovel );

  cdsAvisos.Data := CtrlAvisoImob.LookupQuadroAvisos( Sistema.IdEmpresa,
                                                      Sistema.IdUsuario );

  MontaIndices;
end;

procedure TfrmQuadroAviso.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlContratoImovel );
  FreeAndNil( CtrlAvisoImob );
  inherited;
end;

procedure TfrmQuadroAviso.btnCheckClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a verificação de contratos que não possuem receita gerada?','Confirmação',
            mtConfirmation, [mbYes, mbNo],0) = mrYes then VerificaCobranca;
end;


procedure TfrmQuadroAviso.MontaIndices;
var i : Integer;
    vIndexDef : TIndexDef;
begin
  // Inicializa variáveis global
  sCampoOrdem := '';
  bOrdemAsc   := True;

  cdsAvisos.IndexDefs.Clear;
  cdsAvisos.IndexName := '';
  cdsAvisos.IndexFieldNames := '';

  // Monta um indice crescente e outro decrescente para cada campo da tabela
  for i := 0 to cdsAvisos.FieldCount-1 do begin
    vIndexDef         := cdsAvisos.IndexDefs.AddIndexDef;
    vIndexDef.Name    := cdsAvisos.Fields[i].FieldName + 'ASC';
    vIndexDef.Fields  := cdsAvisos.Fields[i].FieldName;
    vIndexDef.Options := [];

    vIndexDef         := cdsAvisos.IndexDefs.AddIndexDef;
    vIndexDef.Name    := cdsAvisos.Fields[i].FieldName + 'DESC';
    vIndexDef.Fields  := cdsAvisos.Fields[i].FieldName;
    vIndexDef.Options := [ixDescending];
  end;
end;

procedure TfrmQuadroAviso.dbgrdAvisoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  // Se clicar na mesma coluna, inverte a ordem
  if sCampoOrdem = AFieldName then
       bOrdemAsc := not bOrdemAsc
  else bOrdemAsc := True;

  sCampoOrdem := AFieldName;
  if bOrdemAsc then
       cdsAvisos.IndexName := sCampoOrdem + 'ASC'
  else cdsAvisos.IndexName := sCampoOrdem + 'DESC';
  cdsAvisos.First;
end;

procedure TfrmQuadroAviso.dbgrdAvisoDblClick(Sender: TObject);
var
   iContrato : Integer;
begin
  inherited;

//---------- INÍCIO - Marcio Motta - 22/04/2004 - Pendência: 16654 ---------------------------------
  if cdsAvisos.FieldByName('TIPO').AsInteger in [1,2,3,4,5,8] then begin
    // MARCIO: Se um dos menus correspondentes estiver desabilitado, não permite o acesso a tela de cadastro
    if (frmPrincipal.deLocao1.Enabled) or (frmPrincipal.btnCadContrato.Enabled)  then begin
      Application.CreateForm(TfrmCadContratoImovelMT, frmCadContratoImovelMT);
      frmCadContratoImovelMT.AbreContrato( cdsAvisos.FieldByName('IDCONTRATO').AsInteger );
    end
  end else if cdsAvisos.FieldByName('TIPO').AsInteger in [6] then begin
    // MARCIO: Se o menu correspondente estiver desabilitado, não permite o acesso a tela de cadastro
    if frmPrincipal.Seguros1.Enabled then begin
      Application.CreateForm(TfrmCadSeguroImovelMT, frmCadSeguroImovelMT);
      frmCadSeguroImovelMT.AbreContrato( cdsAvisos.FieldByName('IDCONTRATO').AsInteger );
    end;
  end else if cdsAvisos.FieldByName('TIPO').AsInteger in [9,10,11,12,13] then begin
    Application.CreateForm(TfrmExibeEvento, frmExibeEvento);
    frmExibeEvento.Caption := cdsAvisos.FieldByName('DSC_TIPO').AsString;
    frmExibeEvento.Tipo    := cdsAvisos.FieldByName('TIPO').AsInteger;
    frmExibeEvento.IdChave := cdsAvisos.FieldByName('IDCONTRATO').AsInteger;
    frmExibeEvento.edtOrigem.Text := cdsAvisos.FieldByName('NOMECONTRATO').AsString;
    case cdsAvisos.FieldByName('TIPO').AsInteger of
        9 : frmExibeEvento.lblOrigem.Caption := 'Evento';
       10 : frmExibeEvento.lblOrigem.Caption := 'Contrato';
       11 : frmExibeEvento.lblOrigem.Caption := 'Imóvel';
       12 : frmExibeEvento.lblOrigem.Caption := 'Contrato';
       13 : frmExibeEvento.lblOrigem.Caption := 'Contrato';
    end;

    // Marchetti - Pendencia 27479
    iContrato := -1;
    if cdsAvisos.FieldByName('TIPO').AsInteger = 12 then iContrato := cdsAvisos.FieldByName('IDCONTRATO').AsInteger;

//    frmExibeEvento.AbreEvento( cdsAvisos.FieldByName('IDEVENTOIMOVEL').AsInteger );
    frmExibeEvento.AbreEvento( cdsAvisos.FieldByName('IDEVENTOIMOVEL').AsInteger, iContrato );
    // Fim Marchetti - Pendencia 27479
  end;
  //------- FIM - Implementação/Alteração - Marcio Motta ---------------------------------------------
end;

procedure TfrmQuadroAviso.btnImprimirClick(Sender: TObject);
begin
  inherited;
  lblEmpresa.Caption := Sistema.NomeEmpresa;
  lblSistema.Caption := Sistema.NomeModulo;

  // Carrega o Logotipo - Marcio Motta - 09/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogoQuadroAviso.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogoQuadroAviso.Picture := nil;

  cdsAvisos.DisableControls;
  TfrmPreview.CreateModalPreview(Application, rptAvisos,
                                  rptAvisos.PrinterSetup.DocumentName);
  cdsAvisos.EnableControls;
end;

procedure TfrmQuadroAviso.dbgrdAvisoCalcCellColors(Sender: TObject;
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

procedure TfrmQuadroAviso.dbgrdAvisoTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmQuadroAviso.dbgrdAvisoCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
  // Atribui o Glyph na coluna, indicando a ordenação
  if UpperCase(Field.FieldName) = UpperCase(sCampoOrdem) then begin
    TitleImageAttributes.Alignment := taRightJustify;

    if bOrdemAsc then
         TitleImageAttributes.ImageIndex := 0
    else TitleImageAttributes.ImageIndex := 1;
  end else begin
    TitleImageAttributes.ImageIndex := -1;
  end;
end;

procedure TfrmQuadroAviso.VerificaCobranca;
var cdsContrato, cdsLanca : TCMClientDataSet;
    CtrlLancamentos: TCtrlLancamentosImovel;
    dProxCobr, dAviso, dIniCaren, dFimCaren : TDateTime;
    iDia, iMes, iAno : Word;
    iCount, iContr : Integer;
    sDias : String;
begin
  try
     sDias := '';
     InputQuery('Dias de Antecedência', 'Nr. de dias',sDias);

     frmProgresso.MostraFormProgresso('Verificando ausência de receitas... ');

     cdsAvisos.DisableControls;

     // Cria e Inicializa o CtrlObject de Lançamentos
     CtrlLancamentos := TCtrlLancamentosImovel.Create( Sistema.IdEmpresa,
                                                       Sistema.IdModulo,
                                                       Sistema.IdUsuario,
                                                       Sistema.IdEspAcesso,
                                                       Sistema.UsaPlanoPatro );
     CtrlLancamentos.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);

     // Cria CDS's temporáros e Busca os contratos ativos
     cdsContrato := TCMClientDataSet.Create(nil);
     cdsLanca    := TCMClientDataSet.Create(nil);

     cdsContrato.Data := CtrlContratoImovel.LookupContratoImovel(-1, -1,'L','V','S');

     // Excluindo lançamentos anteriores
     cdsAvisos.First;
     while not cdsAvisos.Eof do begin
        if cdsAvisos.FieldByName('TIPO').AsInteger = 5 then
             cdsAvisos.Delete
        else cdsAvisos.Next;
     end;
     cdsAvisos.First;

     iContr := 0;
     iCount := cdsContrato.RecordCount;

     // busca o número de dias de antecedência para o aviso
     try
        dAviso := Date + StrToInt(sDias);
     except
        dAviso := Date;
     end;

     // Verifica para cada contrato se foi gerado receita para o próx. vencto
     while not cdsContrato.Eof do begin
        Inc(iContr);
        frmProgresso.AndaFormProgresso(iContr, iCount);

        // Busca ultimo lançamento de cobrança e define o próximo que deveria existir a partir do ultimo
        cdsLanca.Data := CtrlLancamentos.LookupUltimaCobranca(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger);


// ------------------------------- 23/12/2003 - Marcio -------------------------------
        // se o campo última não for nulo e for menor que a data fim
        // do contrato busca a data última cobrança
        if not cdsLanca.FieldByName('ULTIMA').IsNull and
             ( (cdsLanca.FieldByName('ULTIMA').AsDateTime < cdsContrato.FieldByName('CONDATAFIM').AsDateTime ) or
               (cdsContrato.FieldByName('FLGINDETERMINADO').AsString = 'S') ) then
           dProxCobr := cdsLanca.FieldByName('ULTIMA').AsDateTime
        // se o campo última for nulo, busca a data início do contrato
        else dProxCobr := cdsContrato.FieldByName('CONDATAINICIO').AsDateTime;


        // busca data final da carência
        if not cdsContrato.FieldByName('CONDATACARENCIA').IsNull then
          dFimCaren := cdsContrato.FieldByName('CONDATACARENCIA').AsDateTime
        else
          dFimCaren := cdsContrato.FieldByName('CONDATAINICIO').AsDateTime;

        // busca data inicial da carência
        if not cdsContrato.FieldByName('CONDATAINICAREN').IsNull then
          dIniCaren := cdsContrato.FieldByName('CONDATAINICAREN').AsDateTime
        else
          dIniCaren := dFimCaren;
// -----------------------------------------------------------------------------------


        // preenche as variáveis para cálculo do próximo vencimento
        DecodeDate(dProxCobr, iAno, iMes, iDia);

        // Verifica o próximo vencimento
        Inc(iMes, cdsContrato.FieldByName('CONPERALUGUEL').AsInteger);
        if iMes > 12 then begin
           Inc(iAno, iMes div 12);
           iMes := (iMes - (12 * (iMes div 12)));
        end;

        // pega o mês da data acima e calcula a próxima cobrança
        dProxCobr := FuncoesImob.DataVencAluguel(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                iAno, iMes, 'A', False);

        // Registra no cds de aviso cada parcela que não foi gerada
        while dProxCobr <= dAviso do begin
           // Marcio - 24/12/2003 - Condição adicionada para tratar carência
           if (dProxCobr < dIniCaren) or (dProxCobr > dFimCaren) then begin
              cdsAvisos.Insert;
              cdsAvisos.FieldByName('DSC_TIPO').AsString        := 'Ausência de Receita';
              cdsAvisos.FieldByName('NUMEROCONTRATO').AsString  := cdsContrato.FieldByName('CONNUMERO').AsString;
              cdsAvisos.FieldByName('NOMECONTRATO').AsString    := cdsContrato.FieldByName('CONNOME').AsString;
              cdsAvisos.FieldByName('NOMERESPONSAVEL').AsString := cdsContrato.FieldByName('DSC_RESPONSAVEL').AsString;
              cdsAvisos.FieldByName('DATALIMITE').AsDateTime    := dProxCobr;
              cdsAvisos.FieldByName('IDCONTRATO').AsInteger     := cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;
              cdsAvisos.FieldByName('TIPO').AsInteger           := 5;
              cdsAvisos.Post;
           end;

        // Verifica o próximo vencimento
        Inc(iMes, cdsContrato.FieldByName('CONPERALUGUEL').AsInteger);
        if iMes > 12 then begin
           Inc(iAno, iMes div 12);
           iMes := (iMes - (12 * (iMes div 12)));
        end;

        // pega o mês da data acima e calcula a próxima cobrança
        dProxCobr := FuncoesImob.DataVencAluguel(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                iAno, iMes, 'A', False);

        end;
        cdsContrato.Next;
     end;
  finally
     FreeAndNil( cdsContrato );
     FreeAndNil( cdsLanca );
     FreeAndNil( CtrlLancamentos );
     frmProgresso.EscondeFormProgresso;
     cdsAvisos.First;
     cdsAvisos.EnableControls;
  end;
end;

end.
