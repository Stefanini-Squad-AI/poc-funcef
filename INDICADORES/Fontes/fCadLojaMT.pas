unit fCadLojaMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE LOJAS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  15/05/2002
//      Data de Término :  16/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TREdit,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, DBTables, Provider, DBCtrls, mImovel, uCtrlLoja, FCadastroMT,
  mImovelouMestre;



type
  TfrmCadLojaMT = class(TfrmCadastroMtImob)
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit2: TwwDBEdit;
    dbedtNumLoja: TwwDBEdit;
    Label4: TLabel;
    CdsIDLOJA: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsNUMLOJA: TStringField;
    CdsQTDEABL: TFloatField;
    CdsPISO: TStringField;
    CdsFLGSITUACAO: TStringField;
    CdsIMONOME: TStringField;
    dbrbSituacao: TDBRadioGroup;
    dbedtAbl: TDBRealEdit;
    molImovelouMestre1: TmolImovelouMestre;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlLoja : TCtrlLoja;
    iAblAnt  : Extended;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadLojaMT: TfrmCadLojaMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadLojaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlLoja := TCtrlLoja.Create;
  CtrlLoja.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlLoja.CdsLoja := Cds;
end;

procedure TfrmCadLojaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then begin
     Cds.Data := CtrlLoja.SelecionaLoja( StrToInt(MontaSelect.ValoresChave[0]) );
     molImovelouMestre1.iImovel        := CdsIDIMOVEL.AsInteger;
     molImovelouMestre1.edtImovel.Text := CdsIMONOME.AsString;
  end;
end;


procedure TfrmCadLojaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrbSituacao.ItemIndex := 0;
  molImovelouMestre1.btnBuscaImovel.SetFocus;
end;


procedure TfrmCadLojaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnBuscaImovel.SetFocus;
  iAblAnt := CdsQTDEABL.AsFloat;
end;


procedure TfrmCadLojaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsFloat := molImovelouMestre1.iImovel;
  Accept := CtrlLoja.GravaLoja;
end;


procedure TfrmCadLojaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlLoja.GravaLoja;
end;


procedure TfrmCadLojaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;


function TfrmCadLojaMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if molImovelouMestre1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel',molImovelouMestre1.btnBuscaImovel);

     if dbedtNumLoja.Text = '' then
        raise EValidacao.CreateVal('Informe o Nr. da Loja',dbedtNumLoja);

     if dbedtAbl.Value <= 0 then
        raise EValidacao.CreateVal('Informe a ABL da Loja',dbedtAbl);
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

procedure TfrmCadLojaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  Cds.Data := CtrlLoja.SelecionaLoja( CdsIDLOJA.AsInteger );
  molImovelouMestre1.iImovel        := CdsIDIMOVEL.AsInteger;
  molImovelouMestre1.edtImovel.Text := CdsIMONOME.AsString;
end;

end.
