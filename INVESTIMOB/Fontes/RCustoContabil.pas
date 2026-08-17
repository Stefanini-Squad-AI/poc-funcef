{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 16989
Responsável : Daniel Simões
Data        : 02/02/2007
Descrição   : Implementação de simulação de saldo projetado do imóvel para uma
              data futura.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit RCustoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdblook, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, FSairAjudaImob, uCtrlBem, uCMClientDataSet,
  // Daniel - 16989
  uCtrlPadroes, //uCtrlFechamentoProRata, uCtrlCAFxContab;
  uCtrlImobFechamentoProRata, uCtrlImobCAFxContab;

type
  TfrmRelCustoContabil = class(TfrmSairAjudaImob)
    Label15: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    btnBuscaImovel: TBitBtn;
    btnCalculaSaldo: TBitBtn;
    edtImovel: TEdit;
    edtData: TCMDateTimePicker;
    DBGrd: TwwDBGrid;
    edtCustoTotal: TRealEdit;
    Bevel1: TBevel;
    dsImovelxBem: TwwDataSource;
    qryImovelXBem: TwwQuery;
    updImovelXBem: TUpdateSQL;
    qryImovelXBemIDBEM: TFloatField;
    qryImovelXBemDESBEM: TStringField;
    qryImovelXBemVLR_BEM: TFloatField;
    lblSimula: TLabel;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnCalculaSaldoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure DBGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBGrdTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
   iImovel  : integer;
   CtrlBem  : TCtrlBem;
   //CtrlCAFxContab : TCtrlCAFxContab;
   CtrlCAFxContab : TCtrlImobCAFxContab;

   // Daniel - 16989 - Início
   DataUltimoFechamento : TDateTime;
   //ProRata  : TCtrlFechamentoProRata;
   ProRata  : TCtrlImobFechamentoProRata;
   function UltimoFechamento: TDateTime;
   // Fim.

  public { Public declarations }

  end;



var
  frmRelCustoContabil: TfrmRelCustoContabil;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
  dLookImobiliario, uDocumento, uIntegraBack, FCadastroCS, uAtivoFixo, uFuncoesImob, DMS,
  uModuloImobiliario;


procedure TfrmRelCustoContabil.btnBuscaImovelClick(Sender: TObject);
begin
   // Marcio Motta - 24/01/2005
   qryImovelXBem.Close;
   // Fim - Marcio Motta

   dtmMS.MS_Imovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel        := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      edtImovel.Text := dtmMS.MS_Imovel.ValoresChave[2] + ' - ' +
                        dtmMS.MS_Imovel.ValoresChave[3];

      dtmLookImobiliario.qrySaldoBemXImovelouMestre.Close;
      edtCustoTotal.Value := 0;

      Screen.Cursor := crDefault;
   end;

   if btnBuscaImovel.CanFocus then btnBuscaImovel.SetFocus;
end;



procedure TfrmRelCustoContabil.btnCalculaSaldoClick(Sender: TObject);
var fTotalContabil       : Currency;
    fSldCtbImob          : Extended;

    // Daniel - 16989
    fValOrg  : Currency;
    fCmBem   : Currency;
    fDepLanc : Currency;
    fCmDep   : Currency;
    fSaldo   : Currency;
    bSimula  : Boolean;
    // Fim.
begin
  inherited;

  Screen.Cursor           := crHourGlass;
  btnCalculaSaldo.Enabled := False;
  bbtnSair.Enabled        := False;

  try
    LimpaParametros(qryImovelxBem);
    qryImovelxBem.ParamByName('PIDIMOVEL').asInteger  := iImovel;
    qryImovelxBem.Open;


// Daniel - 16989 - Início -----------------------------------------------------
    bSimula        := False;
    fTotalContabil := 0;

    if (DataUltimoFechamento<edtData.Date) then
       if (MsgDlg('Último fechamento realizado em '+DateToStr(DataUltimoFechamento)+
                  '. Deseja simular o saldo dos bens para '+DateToStr(edtData.Date)+'?','Confirmação',
                  mtConfirmation,[mbYes,mbNo],0) = mrYes) then bSimula := True;

    if not (bSimula) then begin
      lblSimula.Visible := False;

      qryImovelxBem.First;


      while not(qryImovelxBem.EOF) do begin
        qryImovelxBem.Edit;

// Início - Marcio Motta - 24/01/2005 ------------------------------------------
        qryImovelxBem.FieldByName('VLR_BEM').AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                        qryImovelxBem.FieldByName('IDBEM').AsInteger,
                                                        edtData.Date,
                                                        ModuloImobiliario.InvestImob.iIdMoedaCAF,  // Ver3Camadas
                                                        ModuloImobiliario.InvestImob.iIdPaisCAF);  // Ver3Camadas
// Fim - Marcio Motta - 24/01/2005 ---------------------------------------------

        qryImovelxBem.Post;
        fTotalContabil := fTotalContabil + qryImovelxBem.FieldByName('VLR_BEM').AsFloat;
        qryImovelxBem.Next;
      end;
    end else begin
      lblSimula.Visible := True;
      lblSimula.Caption := 'Valores projetados até a data de '+DateToStr(edtData.Date);

      qryImovelxBem.First;

      while not (qryImovelxBem.EOF) do begin
        fValOrg              := 0;
        fCmBem               := 0;
        fDepLanc             := 0;
        fCmDep               := 0;
        fSaldo               := 0;
        qryImovelxBem.Edit;

        try
          ProRata.ExecutarProjecaoBem(Sistema.IdModulo, Sistema.IdEmpresa,
                                      qryImovelxBem.FieldByName('IDBEM').AsInteger,
                                      ModuloImobiliario.InvestImob.iIdMoedaCAF,1,
                                      edtData.Date,
                                      fValOrg, fCmBem, fDepLanc, fCmDep);
        except
           raise Exception.Create(ProRata.MessageInfo);
        end;

        qryImovelxBem.FieldByName('VLR_BEM').AsFloat := fValOrg + fCmBem - fDepLanc - fCmDep;
        qryImovelxBem.Post;

        fTotalContabil := fTotalContabil + qryImovelxBem.FieldByName('VLR_BEM').AsFloat;
        qryImovelxBem.Next;
      end;
    end;
// Daniel - 16989 - Fim --------------------------------------------------------

    edtCustoTotal.Value := fTotalContabil;

  finally
    btnCalculaSaldo.Enabled := True;
    bbtnSair.Enabled        := True;

    Screen.Cursor           := crDefault;
  end;
end;



procedure TfrmRelCustoContabil.FormShow(Sender: TObject);
begin
  inherited;

  edtData.Date := Date;

  // Daniel - 16989
  DataUltimoFechamento    := UltimoFechamento;

  // Marcio Motta - 24/01/2005
  qryImovelxBem.Close;
end;



procedure TfrmRelCustoContabil.edtDataExit(Sender: TObject);
begin
   inherited;

   if edtData.Modified then begin
      LimpaParametros(qryImovelXBem);

      edtCustoTotal.Value  := 0;
      edtData.Modified     := False;
   end;
end;



procedure TfrmRelCustoContabil.DBGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmRelCustoContabil.DBGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelCustoContabil.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlBem := TCtrlBem.Create;
  CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                     ComunsImobiliario.MensErroMT);

  //CtrlCAFxContab := TCtrlCAFxContab.Create;
  CtrlCAFxContab := TCtrlImobCAFxContab.Create;
  CtrlCAFxContab.InitializeAs(CtrlBem);


  // Daniel - 16989
  //ProRata := TCtrlFechamentoProRata.Create(CtrlCAFxContab);
  ProRata := TCtrlImobFechamentoProRata.Create(CtrlCAFxContab);
  ProRata.InitializeAs(Padroes);
  // Fim.

end;

procedure TfrmRelCustoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlBem);
  FreeAndNil(CtrlCAFxContab);
  // Daniel - 16989
  FreeAndNil(ProRata);
end;

// Daniel - 16989 - Início -----------------------------------------------------
function TfrmRelCustoContabil.UltimoFechamento: TDateTime;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  cdsTemp := TCMClientDataSet.Create(nil);
  try
  sSql := 'SELECT MAX(PG.DATAULTFEC) AS DATAMOVIMENTACAO '                      +#13+
          'FROM GRUPO G, PLANOGRUPO PG '                                        +#13+
          'WHERE ( G.FLGIMOVEL = ''1'' ) '                                      +#13+
          '  AND ( PG.IDPESSOA = '+QuotedStr(IntToStr(Sistema.IdEmpresa))+' ) ' +#13+
          '  AND ( G.TIPO = ''A'' ) '                                           +#13+
          '  AND ( PG.DATAULTFEC IS NOT NULL ) '                                +#13+
          '  AND ( PG.IDGRUPO = G.IDGRUPO ) ';

  cdsTemp.Data :=  CtrlBem.GetDataPacket(sSql);
  Result       := cdsTemp.FieldByName('DATAMOVIMENTACAO').AsDateTime;
  
  finally
     cdsTemp.Free;
  end;
end;
// Daniel - 16989 - Fim --------------------------------------------------------

end.
