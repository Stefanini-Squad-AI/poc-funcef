{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                CM Soluções Informática

          DEFINE INÍCIO DA DEPRECIAÇÃO   (MT)

          Módulo: InvestImob
          Programador Responsável: Daniel Simões
          Iniciado e Finalizado em: 06/07/2006

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


unit fExecIniDep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, mImovel, Db, DBTables, Wwquery, mImovelAtivo, uMensErro,
  uFuncoesImob, DBClient, uCMClientDataSet, uCtrlPadroes, uCmSqlParams,
  uCtrlImovel, uCtrlBem, uVerificaPreenchimento, Wwdatsrc, uCtrlEventoImovel,
  uCMControlObject, uSistema, CmEventosCadastro,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;
type
  TfrmExecIniDep = class(TfrmOkCancelar)
    Label3: TLabel;
    edtDataDepreciacao: TCMDateTimePicker;
    molImovelAtivo1: TmolImovelAtivo;
    Label1: TLabel;
    edtDataAquisicao: TCMDateTimePicker;
    Label7: TLabel;
    meObsEvento: TMemo;
    qryBem: TwwQuery;
    qryBemIDBEM: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molImovelAtivo1btnLimpaImovelClick(Sender: TObject);
  private
    { Private declarations }
    CtrlImovel       : TCtrlImovel;
    CtrlBem          : TCtrlBem;
    CtrlEventoImovel : TCtrlEventoImovel;
    iEvento    : Int64;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    function VerificaPreenchimento: Boolean;
    function BuscaDepreciacao(iIdImovel:Integer; sTipoDep:String): Boolean;
  public
    { Public declarations }
  end;

var
  frmExecIniDep: TfrmExecIniDep;

implementation

uses dMS;

{$R *.DFM}

procedure TfrmExecIniDep.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlImovel       := TCtrlImovel.Create;
  CtrlBem          := TCtrlBem.Create;
  CtrlEventoImovel := TCtrlEventoImovel.Create;

  CtrlImovel.InitializeAs(Padroes);
  CtrlBem.InitializeAs(Padroes);
  CtrlEventoImovel.InitializeAs(Padroes);
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

function TfrmExecIniDep.VerificaPreenchimento: Boolean;
var dDataUltMov, dDataUltDep : TDateTime;
begin
   Result := True;

   // Faz a verificação apenas se não houver data de depreciação para o imóvel...
   if not ( BuscaDepreciacao(molImovelAtivo1.iImovel,'DP') ) then begin

      // Obriga a seleção do imóvel...
      if ( (molImovelAtivo1.iImovel <= 0) or (molImovelAtivo1.edtImovel.Text = '') ) then begin
        MsgDlg('É necessário indicar o Imóvel!','Informação',mtWarning,[mbOk],0);
        molImovelAtivo1.btnBuscaImovel.SetFocus;
        Result := False;
        Exit;
      end;

      // Obriga o preenchimento da data da depreciação...
      if edtDataDepreciacao.Date <= 0 then begin
        MsgDlg('É necessário indicar a Data de Início da Depreciação!','Informação',mtWarning,[mbOk],0);
        edtDataDepreciacao.SetFocus;
        Result := False;
        Exit;
      end;
      
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataDepreciacao.Text) then
         begin
            MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
            edtDataDepreciacao.setfocus;
            Result := False;
            exit;
         end;
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

      // Obriga o preenchimento da observação do evento...
      if meObsEvento.Text = '' then begin
        MsgDlg('É necessário indicar a Observação!','Informação',mtWarning,[mbOk],0);
        meObsEvento.SetFocus;
        Result := False;
        Exit;
      end;

      // Verifica Bem a Bem se a data está dentro do período de fechamento...
      with qryBem do begin
        ParamByName('PIDIMOVEL').AsInteger := molImovelAtivo1.iImovel;
        Open;

        while not Eof do begin
          if CtrlBem.VerificaPeriodoCAF(Sistema.IdEmpresa,qryBemIDBEM.AsInteger,1,'14',edtDataDepreciacao.Date,
                                        dDataUltMov,dDataUltDep) then begin
            MsgDlg('Data fora do período de fechamento!','Informação',mtWarning,[mbOk],0);
            edtDataDepreciacao.Date;
            Result := False;
            Exit;
          end;
          Next;
        end;
      end;

   end;
end;

procedure TfrmExecIniDep.molImovelAtivo1btnBuscaImovelClick(
  Sender: TObject);
var dAquisicao, dDataDep : TDateTime;
    sDescricao           : String;
    BuscaDep             : TBuscaDadosDep;
begin
  inherited;
  molImovelAtivo1.btnBuscaImovelClick(Sender);

  if ( CtrlImovel.VerificaDepreciacao(molImovelAtivo1.iImovel) ) then begin
    MsgDlg('Existe movimentação de depreciação para este imóvel.','Informação',mtWarning,[mbOk],0);
    molImovelAtivo1.btnLimpaImovelClick(Sender);
    bbtnConfirmar.Enabled := False;
  end else begin
    BuscaDep := CtrlImovel.BuscaDepreciacao(molImovelAtivo1.iImovel);
    edtDataAquisicao.Date   := CtrlImovel.BuscaDataAquisicao(molImovelAtivo1.iImovel);
    edtDataDepreciacao.Date := BuscaDep.dDataDepreciacao;
    meObsEvento.Text        := BuscaDep.sEvento;
    edtDataDepreciacao.SetFocus;
    bbtnConfirmar.Enabled := True;
  end;


end;

procedure TfrmExecIniDep.molImovelAtivo1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelAtivo1.btnLimpaImovelClick(Sender);
  bbtnConfirmar.Enabled := False;
end;

procedure TfrmExecIniDep.bbtnConfirmarClick(Sender: TObject);
var dDataDep : TDateTime;
begin
  inherited;

  if VerificaPreenchimento then begin
    if CtrlImovel.RegistraDataDepreciacao(molImovelAtivo1.iImovel,edtDataDepreciacao.Date) then begin

      if not ( BuscaDepreciacao(molImovelAtivo1.iImovel,'DP') ) then begin
        CtrlEventoImovel.RegistraEvento(molImovelAtivo1.iImovel,-1,-1,-1,Sistema.IdUsuario,'DP','Depreciação Inicial',
                                        meObsEvento.Text,edtDataDepreciacao.Date);
      end else begin
        if (meObsEvento.Text='') then
          CtrlEventoImovel.ExcluiEvento(-1,molImovelAtivo1.iImovel,-1,-1,-1,'DP',-1)
        else begin
          CtrlEventoImovel.ExcluiEvento(-1,molImovelAtivo1.iImovel,-1,-1,-1,'DP',-1);

          CtrlEventoImovel.RegistraEvento(molImovelAtivo1.iImovel,-1,-1,-1,Sistema.IdUsuario,'DP','Depreciação Inicial',
                                          meObsEvento.Text,edtDataDepreciacao.Date);
        end;
      end;

      bbtnConfirmar.Enabled := False;
    end;
  end else bbtnConfirmar.Enabled := True;
end;

procedure TfrmExecIniDep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlBem);
  FreeAndNil(CtrlEventoImovel);
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
end;

function TfrmExecIniDep.BuscaDepreciacao(iIdImovel:Integer;  sTipoDep:String): Boolean;
var sSql, sParam : String;
    cdsTemp      : TCMClientDataSet;
begin
   Result := True;

   sParam := '';
   if ( iIdImovel <> -1 ) then sParam := sParam + '  AND IDIMOVEL = '+IntToStr(iIdImovel);

   sSql := 'SELECT * FROM EVENTOIMOVEL   '+#13+
           'WHERE FLGTIPOEVENTO = ''DP'' '+#13+sParam;

   try
     cdsTemp      := TCMClientDataSet.Create(nil);
     cdsTemp.Data := Padroes.GetDataPacket(sSql);

     if (cdsTemp.IsEmpty) then Result := False;
   finally
      FreeAndNil( cdsTemp );
   end;
end;

end.
