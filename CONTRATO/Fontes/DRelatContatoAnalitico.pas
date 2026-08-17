{ --------------------------------------------------------------------------------------------------
Rotina......: Inclusão(MontaSituacao, AlinhaSituacao, AtribuiSituacao, ppLabelsNoVisible e PegaSituacao)
              Alteração(ppDetalheBeforePrint, MontaRelatorio, DestroiComponent)
Nº SOL......: 1806055  
Nº KINTANA..: 190136
Data........: 25/03/2013
Responsável.: Felipe Azevedo dos Santos
Descrição...: Alteração na rotina que gera relatório, incluindo o campo situação no cabeçalho e
              no final a inclusão de um resumo da quantidade de contratos por situação.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: ppDetalheBeforePrint
Nº SOL......: 155071
Nº KINTANA..: 1471869
Data........: 13/12/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: A rotina de geração do relatório foi alterada para que as colunas
              DescriçãoContrato, Observação e Renovação. Sejam geradas
              manualmente, onde os itens são carregados um a um através um loop.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina : ppDetalheBeforePrint
SOL: 154189
Kintana: 1210046
Data: 30/03/2011
Responsável: Felipe de Oliveira
Descrição: ajustar o relatório. 

Rotina......: -
Nº SOL......: 151411
Nº KINTANA..: 1107842
Data........: 15/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Ajustes nos campos Descrição do Contrato, Observação e Renovação, pois os mesmos
              não podem aparecer em colunas, precisam ser ajustados abaixo das colunas.
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 99155
Nº KINTANA..: 495508
Data........: 02/09/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criação do relatório de Contratos Analitico com as colunas à escolha do usuário.
-------------------------------------------------------------------------------------------------- }
unit DRelatContatoAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppStrtch, ppMemo, ppSubRpt, Grids, DBGrids,
  ComCtrls ,//Vinicius Maciel SOL 155071 KTN 1471869
  ppModule, raCodMod, ppDBBDE, daDataModule, ppTypes;

type
  TdmtRelatContatoAnalitico = class(TdtmReports)
    pplContratoAnalitico: TppBDEPipeline;
    qryRelatAnalitico: TwwQuery;
    dsContratoAnalitico: TwwDataSource;
    rpContratoAnalitico: TppReport;
    ppTitulo: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppNomeEmpresa: TppLabel;
    ppDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplContratoAnaliticoppField14: TppField;
    qryRateio: TwwQuery;
    ppLine3: TppLine;
    ppColDescr1: TppLabel;
    ppColDescr2: TppLabel;
    ppColDescr3: TppLabel;
    updSituacao: TUpdateSQL;
    ppSituacao: TppLabel;
    ppQuantidade: TppLabel;
    ppValorTotal: TppLabel;
    ppSituacao01: TppLabel;
    ppSituacao02: TppLabel;
    ppQuantidade01: TppLabel;
    ppQuantidade02: TppLabel;
    ppValorTotal01: TppLabel;
    ppSumario: TppSummaryBand;
    ppLine4: TppLine;
    ppValorTotal02: TppLabel;
    ppSituacao03: TppLabel;
    ppQuantidade03: TppLabel;
    ppValorTotal03: TppLabel;
    ppValorTotal04: TppLabel;
    ppQuantidade04: TppLabel;
    ppSituacao04: TppLabel;
    ppTotalGeral: TppLabel;
    ppVlrTotGeral: TppLabel;
    ppQtdTotalGeral: TppLabel;
    ppQuantidade05: TppLabel;
    ppValorTotal05: TppLabel;
    ppSituacao05: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure ppDetalheBeforePrint(Sender: TObject);
    procedure ppDetalheAfterPrint(Sender: TObject);
    procedure ppSumarioBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Coluna: TppDBText;
    ColTitulo, ColEspecial: TppLabel;
    //Vinicius Maciel SOL 155071 KTN 1471869
    //MemoColHorizontal: TppDBMemo;
    MemoColHorizontal: TppMemo;
    function carregaMemo(sColuna : String) : String;
    //Vinicius Maciel SOL 155071 KTN 1471869 - FIM
    procedure MontaSituacao; // Felipe A. Santos SOL 190136 KTN 1806055
    procedure AlinhaSituacao(QtdFields : integer; Top, Left : Double); // Felipe A. Santos SOL 190136 KTN 1806055
    function PegaSituacao : string; // Felipe A. Santos SOL 190136 KTN 1806055
    procedure AtribuiSituacao(QtdFields : integer); // Felipe A. Santos  SOL 190136 KTN 1806055

    { Private declarations }
  public
    SelEmRenovacao : boolean; // Felipe A. Santos SOL 190136 KTN 1806055
    QtdVigente, QtdEncerrado, QtdEmRenovaV,
    QtdEmRenovaE, QtdVencidoNEncerrado : integer;  // Felipe A. Santos SOL 190136 KTN 1806055
    VlrVigente, VlrEncerrado, VlrEmRenovaV,
    VlrEmRenovaE, VlrVencidoNEncerrado : double; // Felipe A. Santos SOL 190136 KTN 1806055
    QtdCampos : integer;
    ContCol : Double;
    ContColHor: Integer;
    ImprimeRateio: Boolean;
    QtdColHorizontal: Integer;
    lSituacao : TStringList; // Felipe A. Santos SOL 190136 KTN 1806055
    function MostraParam(Form: string): boolean;override;
    procedure MontaRelatorio(Campo: String; Titulo: String;
                             Tamanho, Ordem: Integer;
                             FormataValor: Boolean);
    procedure DestroiComponente;
    procedure ppLabelsNoVisible; // Felipe A. Santos SOL 190136 KTN 1806055

    { Public declarations }
  end;

var
  dmtRelatContatoAnalitico: TdmtRelatContatoAnalitico;

implementation
uses FRelatContratosAnalitico, USistema;
{$R *.DFM}

{ TdmtRelatContatoAnalitico }

function TdmtRelatContatoAnalitico.MostraParam(Form: string): boolean;
var frm : TForm;
begin
   if (AnsiUpperCase(Form) = 'FRMRELATCONTRATOSANALITICO') then
      frm := TFRMRELATCONTRATOSANALITICO.Create(Application)
   else
      frm := nil;

   if frm = nil then
     Result := false
   else begin
     with frm do begin
       Result := (ShowModal = mrOk);
       free;
     end;
   end;
end;

procedure TdmtRelatContatoAnalitico.FormCreate(Sender: TObject);
begin
  inherited;
  ContCol:= 0;
  ImprimeRateio:= False;
  ContColHor:= 0;

end;

procedure TdmtRelatContatoAnalitico.MontaRelatorio(Campo, Titulo: String;
  Tamanho, Ordem: Integer; FormataValor: Boolean);
var MyWidth, WidthTitulo: Double;
    nFonte: Integer;
begin

  //ContCol: Controla a contagem das colunas
  //ContColHor: Controla as colunas horizontais, de modo a saber se elas foram impressas ou não
  if (ContCol = 0) and (ContColHor = 0) then
    DestroiComponente;

  Coluna                := TppDBText.Create(Self);
  ColTitulo             := TppLabel.Create(Self);

  //ColTitulo.Color:= ClGray;
  //Vinicius Maciel SOL 155071 KTN 1471869
  //MemoColHorizontal     := TppDBMemo.Create(Self);
  MemoColHorizontal     := TppMemo.Create(Self);
  //Vinicius Maciel SOL 155071 KTN 1471869 - FIM

  if ContColHor = 0 then
    ppDetalhe.Height:= 1.7042;

  //Campos Observação, Renovação e Descrição do Contrato, deverão ser impressos um abaixo do outro,
  //e embaixo das colunas. Por isso crio os memos em ordem especial.
  //Vinicius Maciel SOL 155071 KTN 1471869
  {  if  (Campo =  'OBSERVACAO') or
      (Campo =  'RENOVACAO')  or
      (Campo =  'DESCRICAOCONTRATO') then}
  if  (Campo =  'OBSERVACAO2') or
      (Campo =  'RENOVACAO2')  or
      (Campo =  'DESCRICAOCONTRATO2') then
  //Vinicius Maciel SOL 155071 KTN 1471869 - FIM
  begin
    with MemoColHorizontal do
    begin
      Inc(QtdColHorizontal);
      Name               := 'MemCol' + Campo;
      Band               := ppDetalhe;
      //DataField          := Campo; //Vinicius Maciel SOL 155071 KTN 1471869
      AutoSize           := True;
      WordWrap           := True;
      DataPipeline       := pplContratoAnalitico;
      Left               := 0.9063;
      Width              := 10.3958;
      Height             := 0.5521;
      Transparent        := True;

      //Ajustar a altura dos memos
      if QtdColHorizontal = 1 then
      begin
        ppDetalhe.Height:= 1.9687;
        Top:= 1.4167;
        ColTitulo.Top := 1.4167;
        //Ajustar os labels que não são criados em runtime
        ppColDescr1.Visible  := True;
        ppColDescr1.Top      := 1.4167;
        ppColDescr1.Left     := 0.0521;
        ppColDescr1.Caption  := Titulo;
      end else
      if QtdColHorizontal = 2 then
      begin
        ppDetalhe.Height:= 2.5521;
        Top:= 2;
        ColTitulo.Top := 2;
        //Ajustar os labels que não são criados em runtime
        ppColDescr2.Visible  := True;
        ppColDescr2.Top      := 2;
        ppColDescr2.Left     := 0.0521;
        ppColDescr2.Caption  := Titulo;

      end else
      begin
        ppDetalhe.Height:= 3.1354;
        Top:= 2.5833;
        ColTitulo.Top := 2.5833;
        //Ajustar os labels que não são criados em runtime
        ppColDescr3.Visible  := True;
        ppColDescr3.Top      := 2.5833;
        ppColDescr3.Left     := 0.0521;
        ppColDescr3.Caption  := Titulo;

      end;

    end;
    Inc(ContColHor);
  end;



  //As colunas Observacao, Renovacao e Descr. Contrato não serão criadas como colunas paralelas umas às outras,
  //por isso, só serão criadas essas colunas se o campo for diferente de alguma delas.
  //Vinicius Maciel SOL 155071 KTN 1471869
  {  if (Campo <> 'OBSERVACAO') and
     (Campo <> 'RENOVACAO')  and
     (Campo <> 'DESCRICAOCONTRATO') then}
  if (Campo <> 'OBSERVACAO2') and
     (Campo <> 'RENOVACAO2')  and
     (Campo <> 'DESCRICAOCONTRATO2') then
  //Vinicius Maciel SOL 155071 KTN 1471869 - FIM
  begin
    if Campo = 'RATEIO' then
    begin
      ColEspecial        := TppLabel.Create(Self);
      ImprimeRateio      := True;
      //ColEspecial foi criada exclusivamente para imprimir o camp Rateio, já que esse campo
      //precisa de outra logica antes de ser impresso (ele segue a mesma logica da coluna)
      with ColEspecial do
      begin
        Name               := 'EspCol' + Campo;
        Band               := ppDetalhe;
        AutoSize           := False;
        WordWrap           := True;
        DataPipeline       := pplContratoAnalitico;
        Top                := 0.0208;
        parentDataPipeLine := True;
        Visible            := True;
        Font.Size          := 7;
        nFonte             := 7;
        Transparent        := True;
        if (QtdCampos >= 1) and (QtdCampos <= 5) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 1.3854;
            MyWidth:= 1.3854;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 2.1354;
            Height:= 0.6146;
            MyWidth:= 2.1354;
            WidthTitulo:= MyWidth;
      //      if ppDetalhe.Height < 0.2917 then
      //        ppDetalhe.Height:= 0.6146;
          end;
        end else
        if (QtdCampos >= 6) and (QtdCampos <= 8) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 1.1563;
            MyWidth:= 1.1563;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 1.2917;
            Height:= 1.5833;
            MyWidth:= 1.2917;
            WidthTitulo:= MyWidth;
      //      if ppDetalhe.Height < 0.2917 then
      //        ppDetalhe.Height:= 1.5937;
          end;
        end else
        if (QtdCampos >= 9) and (QtdCampos <= 10) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 0.6042;
            MyWidth:= 0.6042;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 0.9896;
            Height:= 1.5833;
            MyWidth:= 0.9896;
            WidthTitulo:= MyWidth;
       //     if ppDetalhe.Height < 0.2917 then
       //       ppDetalhe.Height:= 1.5937;
          end;
        end else
        if (QtdCampos >= 11) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 0.5104;
            MyWidth:= 0.5104;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 0.8854;
            Height:= 1.5833;
            MyWidth:= 0.8854;
            WidthTitulo:= MyWidth;
        //    if ppDetalhe.Height < 0.2917 then
        //      ppDetalhe.Height:= 1.5937;
          end;
        end;
        Left:= ContCol;
      end;
    end
    else
    begin
      //A quantidade de campos serve pra determinar quantos campos serão impressos para determinar a largura dos campos.
      with Coluna do
      begin
        Name               := 'Col' + Campo;
        Band               := ppDetalhe;
        AutoSize           := False;
        WordWrap           := True;
        DataPipeline       := pplContratoAnalitico;
        DataField          := Campo;

        Top                := 0.0208;
        parentDataPipeLine := True;
        Visible            := True;
        Font.Size          := 7;
        nFonte             := 7;
        Transparent        := True;
        if FormataValor then
        begin
          DisplayFormat:='###,###,##0.00';
          TextAlignment:= taRightJustified;
        end;

        if (QtdCampos >= 1) and (QtdCampos <= 5) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 1.3854;
            MyWidth:= 1.3854;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 2.1354;
            Height:= 0.6146;
            MyWidth:= 2.1354;
            WidthTitulo:= MyWidth;
         //   if ppDetalhe.Height < 0.2917 then
         //     ppDetalhe.Height:= 0.6146;
          end;
        end else
        if (QtdCampos >= 6) and (QtdCampos <= 8) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 1.1563;
            MyWidth:= 1.1563;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 1.2917;
            Height:= 1.5833;
            MyWidth:= 1.2917;
            WidthTitulo:= MyWidth;
          //  if ppDetalhe.Height < 0.2917 then
          //    ppDetalhe.Height:= 1.5937;
          end;
        end else
        if (QtdCampos >= 9) and (QtdCampos <= 10) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 0.6042;
            MyWidth:= 0.6042;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 0.9896;
            Height:= 1.5833;
            MyWidth:= 0.9896;
            WidthTitulo:= MyWidth;
           // if ppDetalhe.Height < 0.2917 then
           //   ppDetalhe.Height:= 1.5937;
          end;
        end else
        if (QtdCampos >= 11) then
        begin
          if Tamanho <= 10 then
          begin
            Width:= 0.5104;
            MyWidth:= 0.5104;
            WidthTitulo:= MyWidth;
          end else
          if (tamanho >= 20) then
          begin
            Width:= 0.8854;
            Height:= 1.5833;
            MyWidth:= 0.8854;
            WidthTitulo:= MyWidth;
            //if ppDetalhe.Height < 0.2917 then
            //  ppDetalhe.Height:= 1.5937;
          end;
        end;

        Left:= ContCol;
      end;
    end;

    with ColTitulo do
    begin
      Name:= 'sCol' + Campo;
      Caption:=  Titulo;
      Band:= ppTitulo;
      Caption:= Titulo;
      Top:= 0.7292;
      Left:= ContCol;
      Font.Size:= nFonte;
      Font.Style:= [FsBold];
      Transparent := True;
      if FormataValor then
      begin
        TextAlignment:= taRightJustified;
        Width:= WidthTitulo;
      end;
    end;
    ContCol:= ContCol + (MyWidth +  0.33);
  end;

  // Felipe A. Santos SOL 190136 KTN 1806055

  // Ajusta o espaço de RATEIO E FORNECEDOR no cabeçalho

  if (Campo = 'RATEIO') then
     ContCol := ContCol - 0.45;

  if (Campo = 'VALORBASECONTRATO') then
     ContCol := ContCol + 0.25;

  // Felipe A. Santos SOL 190136 KTN 1806055 - FIM

end;

procedure TdmtRelatContatoAnalitico.DestroiComponente;
begin
  //Destruindo a coluna
  Coluna := TppDBText(Self.FindComponent('COLNOMECONTRATO'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLCODCONTRATOEMPR'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLDATAASSINATURA'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  //Coluna := TppDBText(Self.FindComponent('COLDESCRICAOCONTRATO'));
  Coluna := TppDBText(Self.FindComponent('COLDESCRICAOCONTRATO2')); //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLVALORBASECONTRATO'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLRAZAOSOCIAL'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLNOME_ITEM'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLNOMEOBJETO'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLRATEIO'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  //Coluna := TppDBText(Self.FindComponent('COLOBSERVACAO'));
  Coluna := TppDBText(Self.FindComponent('COLOBSERVACAO2'));  //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  //Coluna := TppDBText(Self.FindComponent('COLRENOVACAO'));
  Coluna := TppDBText(Self.FindComponent('COLRENOVACAO2'));//Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLDATAPREVENCERRA'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLDATAEFETENCERRA'));
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  Coluna := TppDBText(Self.FindComponent('COLSITUACAO'));   // Felipe A. Santos SOL 190136 KTN 1806055
  if Assigned(Coluna) then
    FreeAndNil(Coluna);

  //Destruindo os titulos
  ColTitulo := TppLabel(Self.FindComponent('SCOLNOMECONTRATO'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLCODCONTRATOEMPR'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLDATAASSINATURA'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  //ColTitulo := TppLabel(Self.FindComponent('SCOLDESCRICAOCONTRATO'));
  ColTitulo := TppLabel(Self.FindComponent('SCOLDESCRICAOCONTRATO2')); //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLVALORBASECONTRATO'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLRAZAOSOCIAL'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLNOME_ITEM'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLNOMEOBJETO'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLRATEIO'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  //ColTitulo := TppLabel(Self.FindComponent('SCOLOBSERVACAO'));
  ColTitulo := TppLabel(Self.FindComponent('SCOLOBSERVACAO2')); //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  //ColTitulo := TppLabel(Self.FindComponent('SCOLRENOVACAO'));
  ColTitulo := TppLabel(Self.FindComponent('SCOLRENOVACAO2')); //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLDATAPREVENCERRA'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLDATAEFETENCERRA'));
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  ColTitulo := TppLabel(Self.FindComponent('SCOLSITUACAO'));   // Felipe A. Santos SOL 190136 KTN 1806055
  if Assigned(ColTitulo) then
    FreeAndNil(ColTitulo);

  //Destruindo a coluna especial (rateio)
  ColEspecial := TppLabel(Self.FindComponent('ESPCOLRATEIO'));
  if Assigned(ColEspecial) then
    FreeAndNil(ColEspecial);

  //Destruindo os Memos
  //MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLOBSERVACAO'));
  MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLOBSERVACAO2'));//Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(MemoColHorizontal) then
    FreeAndNil(MemoColHorizontal);

  //MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLRENOVACAO'));
  MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLRENOVACAO2'));//Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(MemoColHorizontal) then
    FreeAndNil(MemoColHorizontal);

  //MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLDESCRICAOCONTRATO'));
  MemoColHorizontal:= TppMemo(Self.FindComponent('MEMCOLDESCRICAOCONTRATO2')); //Vinicius Maciel SOL 155071 KTN 1471869
  if Assigned(MemoColHorizontal) then
    FreeAndNil(MemoColHorizontal);
end;

procedure TdmtRelatContatoAnalitico.ppDetalheBeforePrint(Sender: TObject);
var lRateios: String;
    tsLinha : TStrings; //Vinicius Maciel SOL 155071 KTN 1471869
begin
  inherited;
  if ImprimeRateio then
  begin
    qryRateio.Close;
    qryRateio.Sql.Clear;
    qryRateio.Sql.Add('SELECT DISTINCT CC.NOME');
    qryRateio.Sql.Add('FROM CENTCUST CC,');
    qryRateio.Sql.Add('RATEIOCENTROCUSTO R,');
    qryRateio.Sql.Add('CONTRATOCONTR     C');
    qryRateio.Sql.Add('WHERE C.IDCONTRATO = R.IDCONTRATO(+)');
    qryRateio.Sql.Add('AND   R.CODCENTROCUSTO = CC.CODCENTROCUSTO');
    qryRateio.Sql.Add('   AND (C.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')' );
    qryRateio.Sql.Add('   AND C.IDCONTRATO IN');
    qryRateio.Sql.Add('       (SELECT IDCONTRATO FROM CONTRATOUSUARIO WHERE IDUSUARIO = ' + InttoStr(Sistema.IdUsuario) + ')');
    // Felipe de Oliveira SOL154189
    // se  o idcontrato não vier preenchido ocorre erro.
    qryRateio.Sql.Add('   AND C.IDCONTRATO = ' + IntToStr(qryRelatAnalitico.FieldByName('IDCONTRATO').AsInteger));

    qryRateio.Open;
    if qryRateio.RecordCount > 0 then
    begin
      qryRateio.First;
      while not qryRateio.Eof do
      begin
        lRateios:= lRateios + ', ' + qryRateio.FieldByName('NOME').AsString;
        qryRateio.Next;
      end;

      Delete(lRateios, 1, 1);
      ColEspecial := TppLabel(Self.FindComponent('ESPCOLRATEIO'));
      if Assigned(ColEspecial) then
      begin
        with ColEspecial do
        begin
          Caption:= lRateios;
        end;
      end;
    end;
  end;
    //Vinicius Maciel SOL 155071 KTN 1471869
    if Assigned(TppMemo(Self.FindComponent('MemColDESCRICAOCONTRATO2'))) then
    begin
        TppMemo(Self.FindComponent('MemColDESCRICAOCONTRATO2')).Lines.Clear;
        tsLinha :=  TppMemo(Self.FindComponent('MemColDESCRICAOCONTRATO2')).Lines;
        tsLinha.add(carregaMemo('DESCRICAOCONTRATO'));
    end;
    if Assigned(TppMemo(Self.FindComponent('MemColOBSERVACAO2'))) then
    begin
        TppMemo(Self.FindComponent('MemColOBSERVACAO2')).Lines.Clear;
        tsLinha :=  TppMemo(Self.FindComponent('MemColOBSERVACAO2')).Lines;
        tsLinha.add(carregaMemo('OBSERVACAO'));
    end;
    if Assigned(TppMemo(Self.FindComponent('MemColRENOVACAO2'))) then
    begin
        TppMemo(Self.FindComponent('MemColRENOVACAO2')).Lines.Clear;
        tsLinha :=  TppMemo(Self.FindComponent('MemColRENOVACAO2')).Lines;
        tsLinha.add(carregaMemo('RENOVACAO'));
    end;
    //Vinicius Maciel SOL 155071 KTN 1471869 - FIM

    // Felipe A. Santos SOL 190136 KTN 1806055
    if (qryRelatAnalitico.FindField('SITUACAO') <> nil) then
    begin
         qryRelatAnalitico.Edit;
         qryRelatAnalitico.FieldByName('SITUACAO').AsString := PegaSituacao;
    end;
    // Felipe A. Santos SOL 190136 KTN 1806055 - Fim


end;

procedure TdmtRelatContatoAnalitico.ppDetalheAfterPrint(Sender: TObject);
begin
  inherited;
  QtdColHorizontal:= 0;
end;

//Vinicius Maciel SOL 155071 KTN 1471869
function TdmtRelatContatoAnalitico.carregaMemo(sColuna : String) : String;
var
    sCampo : String;
    qryAux : TwwQuery;
begin
    qryAux := TwwQuery.Create(nil);
    qryAux.DatabaseName := 'BASEDADOS';
    qryAux.sql.add('select C.DESCRICAOCONTRATO, C.OBSERVACAO, C.RENOVACAO from CONTRATOCONTR C where idcontrato = '+qryRelatAnalitico.FieldByName('IDCONTRATO').asString);
    qryAux.open;
    result := qryAux.FieldByName(sColuna).asString;
    FreeAndNil(qryAux);
end;
//Vinicius Maciel SOL 155071 KTN 1471869 - FIM

// Felipe A. Santos SOL 190136 KTN 1806055 - INICIO
function TdmtRelatContatoAnalitico.PegaSituacao: string;
var
   qry : TwwQuery;
   FlgFimContrato, FlgRenovacao, Situacao : string;
   DataPrevEncerra, DataEfetEncerra : TDate;
begin

   try
      qry := TwwQuery.Create(Self);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Clear;
      qry.SQL.Add('SELECT FLGFIMCONTRATO, FLGRENOVACAO, DATAPREVENCERRA, DATAEFETENCERRA FROM CONTRATOCONTR ' +
                          'WHERE IDCONTRATO = :IDCONTRATO');
      qry.Params[0].AsString := qryRelatAnalitico.FieldByName('IDCONTRATO').AsString;
      qry.Open;

      FlgFimContrato := qry.Fields[0].AsString;
      FlgRenovacao := qry.Fields[1].AsString;

      if (qry.Fields[2].AsString = '') then
          DataPrevEncerra := 0
      else
          DataPrevEncerra := StrToDate(qry.Fields[2].AsString);

      if (qry.Fields[3].AsString = '') then
          DataEfetEncerra := 0
      else
          DataEfetEncerra := StrToDate(qry.Fields[3].AsString);

      if ((FlgFimContrato = 'S') and (FlgRenovacao <> 'S') and (DataPrevEncerra > Date)) or
         ((FlgFimContrato = 'S') and (FlgRenovacao = '')) or (FlgFimContrato = 'N') then
      begin
         Situacao := 'Vigente';
      end
      else if (FlgFimContrato = 'E')  and ((FlgRenovacao = '') or (FlgRenovacao <> 'S'))  and
              (DataEfetEncerra <> 0) then
      begin
         Situacao := 'Encerrado';
      end
      else if (FlgFimContrato = 'S') and (FlgRenovacao = 'S') then
      begin
         Situacao := 'Em renovação / Vigente';
      end
      else if (FlgFimContrato = 'E') and (FlgRenovacao = 'S') then
      begin
         Situacao := 'Em renovação / Encerrado';
      end
      else if (FlgRenovacao <> 'S') and (DataPrevEncerra < Date) and (DataEfetEncerra = 0) then
      begin
         Situacao := 'Vencido e não encerrado';
      end
      else
         Situacao := '';

      Result := Situacao;

   finally
      FreeAndNil(qry);
   end;

end;

procedure TdmtRelatContatoAnalitico.MontaSituacao;
var
   iFields, i, QtdTotal : integer;
   VlrTotal : Double;
begin

     if (lSituacao.Count = 0) then
     begin
          ppSumario.Visible := False;
     end
     else
     begin
       ppSumario.Visible := True;   
       QtdTotal := 0;
       VlrTotal := 0.00;
       SelEmRenovacao := False;

       ppSituacao.Visible := True;
       ppQuantidade.Visible := True;
       ppValorTotal.Visible := True;

       ppTotalGeral.Visible := True;
       ppVlrTotGeral.Visible := True;
       ppQtdTotalGeral.Visible := True;

       ppSituacao.Top := 0.2396;
       ppSituacao.Left := 0.2813;

       ppQuantidade.Top := 0.2396;
       ppQuantidade.Left := ppSituacao.Left + 4.2;

       ppValorTotal.Top := 0.2396;
       ppValorTotal.Left := ppSituacao.Left + 8.9;

        for iFields := 1 to lSituacao.Count  do
        begin

          // pega os valores das situações selecionadas
          if (lSituacao.Strings[iFields - 1] = 'Em renovação') then
          begin
              SelEmRenovacao := True;
              AtribuiSituacao(iFields + 1);
          end
          else
          begin
               // verifica o loop ja passou pelo campo Em Renovacao
              if (SelEmRenovacao) then
              begin
                   AtribuiSituacao(iFields + 1);
              end
              else
              begin
                   AtribuiSituacao(iFields)
              end;
          end;
        end;

       // atribui o total
       for i := 0 to lSituacao.Count - 1 do
             begin
             if (lSituacao.Strings[i] = 'Vigente') then
             begin
                  QtdTotal := QtdTotal + QtdVigente;
                  VlrTotal := VlrTotal + VlrVigente;
             end
             else if (lSituacao.Strings[i] = 'Encerrado') then
             begin
                  QtdTotal := QtdTotal + QtdEncerrado;
                  VlrTotal := VlrTotal + VlrEncerrado;
             end
             else if (lSituacao.Strings[i] = 'Em renovação') then
             begin
                  QtdTotal := QtdTotal + QtdEmRenovaV + QtdEmRenovaE;
                  VlrTotal := VlrTotal + VlrEmRenovaV + VlrEmRenovaE;
             end
             else
             begin
                  QtdTotal := QtdTotal + QtdVencidoNEncerrado;
                  VlrTotal := VlrTotal + VlrVencidoNEncerrado;
             end;
        end;

        ppQtdTotalGeral.Caption := IntToStr(QtdTotal);
        ppVlrTotGeral.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrTotal);


        // alinhas as labels de acordo com as situações selecionadas
        if (SelEmRenovacao) then
           AlinhaSituacao(lSituacao.Count + 1, ppSituacao.Top + 0.300, ppSituacao.Left)
        else
           AlinhaSituacao(lSituacao.Count, ppSituacao.Top + 0.300, ppSituacao.Left);
     end;

end;

procedure TdmtRelatContatoAnalitico.ppSumarioBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabelsNoVisible;
  MontaSituacao;
end;

procedure TdmtRelatContatoAnalitico.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(lSituacao) then
     FreeAndNil(lSituacao);
end;

procedure TdmtRelatContatoAnalitico.AlinhaSituacao(QtdFields : integer; Top, Left : Double);
var
   QtdLeft, VlrLeft : Double;
begin


     QtdLeft := 4.8 + Left;
     VlrLeft := 9.0 + Left;

    // alinha as labels no relatório de acordo com as situações escolhidas
    Case QtdFields of

        1 :
        begin
            ppSumario.Height := 0.7708;
            ppSituacao01.Top := Top;
            ppSituacao01.Left := Left;

            ppQuantidade01.Top := Top;
            ppQuantidade01.Left := QtdLeft;

            ppValorTotal01.Top := Top;
            ppValorTotal01.Left := VlrLeft;

            ppTotalGeral.Top := Top + 0.300;
            ppTotalGeral.Left := Left;

            ppQtdTotalGeral.Top := Top + 0.300;
            ppQtdTotalGeral.Left := QtdLeft;

            ppVlrTotGeral.Top := Top + 0.300;
            ppVlrTotGeral.Left := VlrLeft;

        end;
        2 :
        begin
            ppSumario.Height := 0.9708;

            ppSituacao01.Top := Top;
            ppSituacao01.Left := Left;
            ppSituacao02.Top := Top + 0.300;
            ppSituacao02.Left := Left;

            ppQuantidade01.Top := Top;
            ppQuantidade01.Left := QtdLeft;
            ppQuantidade02.Top := Top + 0.300;
            ppQuantidade02.Left := QtdLeft;

            ppValorTotal01.Top := Top;
            ppValorTotal01.Left := VlrLeft;
            ppValorTotal02.Top := Top + 0.300;
            ppValorTotal02.Left := VlrLeft;

            ppTotalGeral.Top := Top + 0.600;
            ppTotalGeral.Left := Left;

            ppQtdTotalGeral.Top := Top + 0.600;
            ppQtdTotalGeral.Left := QtdLeft;

            ppVlrTotGeral.Top := Top + 0.600;
            ppVlrTotGeral.Left := VlrLeft;

        end;

        3 :
        begin
            ppSumario.Height := 1.0708;

            ppSituacao01.Top := Top;
            ppSituacao01.Left := Left;
            ppSituacao02.Top := Top + 0.300;
            ppSituacao02.Left := Left;
            ppSituacao03.Top := Top + 0.600;
            ppSituacao03.Left := Left;

            ppQuantidade01.Top := Top;
            ppQuantidade01.Left := QtdLeft;
            ppQuantidade02.Top := Top + 0.300;
            ppQuantidade02.Left := QtdLeft;
            ppQuantidade03.Top := Top + 0.600;
            ppQuantidade03.Left := QtdLeft;

            ppValorTotal01.Top := Top;
            ppValorTotal01.Left := VlrLeft;
            ppValorTotal02.Top := Top + 0.300;
            ppValorTotal02.Left := VlrLeft;
            ppValorTotal03.Top := Top + 0.600;
            ppValorTotal03.Left := VlrLeft;

            ppTotalGeral.Top := Top + 0.900;
            ppTotalGeral.Left := Left;

            ppQtdTotalGeral.Top := Top + 0.900;
            ppQtdTotalGeral.Left := QtdLeft;

            ppVlrTotGeral.Top := Top + 0.900;
            ppVlrTotGeral.Left := VlrLeft;

        end;

        4:
        begin
            ppSumario.Height := 1.1508;

            ppSituacao01.Top := Top;
            ppSituacao01.Left := Left;
            ppSituacao02.Top := Top + 0.300;
            ppSituacao02.Left := Left;
            ppSituacao03.Top := Top + 0.600;
            ppSituacao03.Left := Left;
            ppSituacao04.Top := Top + 0.900;
            ppSituacao04.Left := Left;

            ppQuantidade01.Top := Top;
            ppQuantidade01.Left := QtdLeft;
            ppQuantidade02.Top := Top + 0.300;
            ppQuantidade02.Left := QtdLeft;
            ppQuantidade03.Left := QtdLeft;
            ppQuantidade03.Top := Top + 0.600;
            ppQuantidade04.Left := QtdLeft;
            ppQuantidade04.Top := Top + 0.900;


            ppValorTotal01.Top := Top;
            ppValorTotal01.Left := VlrLeft;
            ppValorTotal02.Top := Top + 0.300;
            ppValorTotal02.Left := VlrLeft;
            ppValorTotal03.Top := Top + 0.600;
            ppValorTotal03.Left := VlrLeft;
            ppValorTotal04.Top := Top + 0.900;
            ppValorTotal04.Left := VlrLeft;

            ppTotalGeral.Top := Top + 1.200;
            ppTotalGeral.Left := Left;

            ppQtdTotalGeral.Top := Top + 1.200;
            ppQtdTotalGeral.Left := QtdLeft;

            ppVlrTotGeral.Top := Top + 1.200;
            ppVlrTotGeral.Left := VlrLeft;
        end;

        else
        begin
            ppSumario.Height := 1.3708;

            ppSituacao01.Top := Top;
            ppSituacao01.Left := Left;
            ppSituacao02.Top := Top + 0.300;
            ppSituacao02.Left := Left;
            ppSituacao03.Top := Top + 0.600;
            ppSituacao03.Left := Left;
            ppSituacao04.Top := Top + 0.900;
            ppSituacao04.Left := Left;
            ppSituacao05.Top := Top + 1.200;
            ppSituacao05.Left := Left;

            ppQuantidade01.Top := Top;
            ppQuantidade01.Left := QtdLeft;
            ppQuantidade02.Top := Top + 0.300;
            ppQuantidade02.Left := QtdLeft;
            ppQuantidade03.Left := QtdLeft;
            ppQuantidade03.Top := Top + 0.600;
            ppQuantidade04.Left := QtdLeft;
            ppQuantidade04.Top := Top + 0.900;
            ppQuantidade05.Left := QtdLeft;
            ppQuantidade05.Top := Top + 1.200;

            ppValorTotal01.Top := Top;
            ppValorTotal01.Left := VlrLeft;
            ppValorTotal02.Top := Top + 0.300;
            ppValorTotal02.Left := VlrLeft;
            ppValorTotal03.Top := Top + 0.600;
            ppValorTotal03.Left := VlrLeft;
            ppValorTotal04.Top := Top + 0.900;
            ppValorTotal04.Left := VlrLeft;
            ppValorTotal05.Top := Top + 1.200;
            ppValorTotal05.Left := VlrLeft;

            ppTotalGeral.Top := Top + 1.500;
            ppTotalGeral.Left := Left;

            ppQtdTotalGeral.Top := Top + 1.500;
            ppQtdTotalGeral.Left := QtdLeft;

            ppVlrTotGeral.Top := Top + 1.500;
            ppVlrTotGeral.Left := VlrLeft;
        end;

    end;

end;

procedure TdmtRelatContatoAnalitico.AtribuiSituacao(QtdFields: integer);
var
   i : integer;
begin

     if (SelEmRenovacao) then
        i := QtdFields - 2
     else
        i := QtdFields - 1;

    if (QtdFields = 1) then
    begin
            ppSituacao01.Visible := True;
            ppQuantidade01.Visible := True;
            ppValorTotal01.Visible := True;

            if (lSituacao.Strings[i] = 'Vigente') then
            begin
                 ppSituacao01.Caption := 'Vigente';
                 ppQuantidade01.Caption := IntToStr(QtdVigente);
                 ppValorTotal01.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrVigente);
            end
            else if (lSituacao.Strings[i] = 'Encerrado') then
            begin
                 ppSituacao01.Caption := 'Encerrado';
                 ppQuantidade01.Caption := IntToStr(QtdEncerrado);
                 ppValorTotal01.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrEncerrado);
            end
            else
            begin
                 ppSituacao01.Caption := 'Vencido e não encerrado';
                 ppQuantidade01.Caption := IntToStr(QtdVencidoNEncerrado);
                 ppValorTotal01.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrVencidoNEncerrado);
            end;
    end
    else if (QtdFields = 2) then
    begin
            ppSituacao02.Visible := True;
            ppQuantidade02.Visible := True;
            ppValorTotal02.Visible := True;

            if (lSituacao.Strings[i] = 'Encerrado') then
            begin
                 ppSituacao02.Caption := 'Encerrado';
                 ppQuantidade02.Caption := IntToStr(QtdEncerrado);
                 ppValorTotal02.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrEncerrado);
            end
            else if (lSituacao.Strings[i] = 'Em renovação') then
            begin
                 ppSituacao01.Visible := True;
                 ppQuantidade01.Visible := True;
                 ppValorTotal01.Visible := True;

                 ppSituacao01.Caption := 'Em renovação / Vigente';
                 ppSituacao02.Caption := 'Em renovação / Encerrado';

                 ppQuantidade01.Caption := IntToStr(QtdEmRenovaV);
                 ppQuantidade02.Caption := IntToStr(QtdEmRenovaE);

                 ppValorTotal01.Caption := 'R$ ' + FormatFloat('###,###,#0.00', VlrEmRenovaV);
                 ppValorTotal02.Caption := 'R$ ' + FormatFloat('###,###,#0.00',VlrEmRenovaE);

            end
            else
            begin
                 ppSituacao02.Caption := 'Vencido e não encerrado';
                 ppQuantidade02.Caption := IntToStr(QtdVencidoNEncerrado);
                 ppValorTotal02.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrVencidoNEncerrado);
            end;
    end
    else if (QtdFields = 3) then
    begin
             ppSituacao03.Visible := True;
             ppQuantidade03.Visible := True;
             ppValorTotal03.Visible := True;


            if (lSituacao.Strings[i] = 'Em renovação') then
            begin
                 ppSituacao02.Visible := True;
                 ppQuantidade02.Visible := True;
                 ppValorTotal02.Visible := True;

                 ppSituacao02.Caption := 'Em renovação / Vigente';
                 ppSituacao03.Caption := 'Em renovação / Encerrado';

                 ppQuantidade02.Caption := IntToStr(QtdEmRenovaV);
                 ppQuantidade03.Caption := IntToStr(QtdEmRenovaE);

                 ppValorTotal02.Caption := 'R$ ' + FormatFloat('###,###,#0.00', VlrEmRenovaV);
                 ppValorTotal03.Caption := 'R$ ' + FormatFloat('###,###,#0.00',VlrEmRenovaE);

            end
            else
            begin
                 ppSituacao03.Caption := 'Vencido e não encerrado';
                 ppQuantidade03.Caption := IntToStr(QtdVencidoNEncerrado);
                 ppValorTotal03.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrVencidoNEncerrado);
            end;
    end
    else if (QtdFields = 4) then
    begin
             ppSituacao04.Visible := True;
             ppQuantidade04.Visible := True;
             ppValorTotal04.Visible := True;


             ppSituacao03.Visible := True;
             ppQuantidade03.Visible := True;
             ppValorTotal03.Visible := True;

             ppSituacao03.Caption := 'Em renovação / Vigente';
             ppSituacao04.Caption := 'Em renovação / Encerrado';

             ppQuantidade03.Caption := IntToStr(QtdEmRenovaV);
             ppQuantidade04.Caption := IntToStr(QtdEmRenovaE);

             ppValorTotal03.Caption := 'R$ ' + FormatFloat('###,###,#0.00', VlrEmRenovaV);
             ppValorTotal04.Caption := 'R$ ' + FormatFloat('###,###,#0.00',VlrEmRenovaE);

    end
    else
    begin
            ppSituacao05.Visible := True;
            ppQuantidade05.Visible := True;
            ppValorTotal05.Visible := True;

            ppSituacao05.Caption := 'Vencido e não encerrado';
            ppQuantidade05.Caption := IntToStr(QtdVencidoNEncerrado);
            ppValorTotal05.Caption := 'R$ ' + FormatFloat('###,###,##0.00', VlrVencidoNEncerrado);
    end;

end;

procedure TdmtRelatContatoAnalitico.ppLabelsNoVisible;
begin
   ppSituacao01.Visible := False;
   ppSituacao02.Visible := False;
   ppSituacao03.Visible := False;
   ppSituacao04.Visible := False;
   ppSituacao05.Visible := False;

   ppQuantidade01.Visible := False;
   ppQuantidade02.Visible := False;
   ppQuantidade03.Visible := False;
   ppQuantidade04.Visible := False;
   ppQuantidade05.Visible := False;

   ppValorTotal01.Visible := False;
   ppValorTotal02.Visible := False;
   ppValorTotal03.Visible := False;
   ppValorTotal04.Visible := False;
   ppValorTotal05.Visible := False;

   ppTotalGeral.Visible := False;
   ppTotalGeral.Visible := False;

   ppQtdTotalGeral.Visible := False;
   ppQtdTotalGeral.Visible := False;

   ppVlrTotGeral.Visible := False;
   ppVlrTotGeral.Visible := False;

end;
// Felipe A. Santos SOL 190136 KTN 1806055 - FIM


end.
