{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecDesfazRetificacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, mImovelouMestre, uCtrlEventoImovel, uCtrlMovReavaliacao,
  DBClient, Provider, DBTables, Db, Wwdatsrc, Wwquery;

type
  TfrmExecDesfazRetificacao = class(TfrmOkCancelar)
    MS_Retifica: TMontaSelect;
    molImovelouMestre: TmolImovelouMestre;
    qryBem: TwwQuery;
    dsBem: TwwDataSource;
    updBem: TUpdateSQL;
    dspBem: TDataSetProvider;
    cdsBem: TClientDataSet;
    qryBemIDPESSOA: TFloatField;
    qryBemIDRETIFICREAV: TFloatField;
    qryBemIDIMOVEL: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDATAREAVALIACAO: TDateTimeField;
    qryBemVLR_REAVALIA: TFloatField;
    qryBemVIDAUTIL: TFloatField;
    qryBemVLR_CONTABIL: TFloatField;
    qryBemNOVAVIDAUTIL: TFloatField;
    qryBemNOVOVLR_REAVALIA: TFloatField;
    qryBemULT_REAVALIACAO: TDateTimeField;
    cdsBemIDPESSOA: TFloatField;
    cdsBemIDRETIFICREAV: TFloatField;
    cdsBemIDIMOVEL: TFloatField;
    cdsBemIDBEM: TFloatField;
    cdsBemDESBEM: TStringField;
    cdsBemDATAREAVALIACAO: TDateTimeField;
    cdsBemVLR_REAVALIA: TFloatField;
    cdsBemVIDAUTIL: TFloatField;
    cdsBemVLR_CONTABIL: TFloatField;
    cdsBemNOVAVIDAUTIL: TFloatField;
    cdsBemNOVOVLR_REAVALIA: TFloatField;
    cdsBemULT_REAVALIACAO: TDateTimeField;
    qryDeletaReavalia: TwwQuery;
    procedure molImovelouMestrebtnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molImovelouMestrebtnLimpaImovelClick(Sender: TObject);
  private
    { Private declarations }
    iImovel            : Integer;
    dDataProcesso      : TDateTime;
    
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlMovReavaliacao : TCtrlMovReavaliacao;
  public
    { Public declarations }
  end;

var
  frmExecDesfazRetificacao: TfrmExecDesfazRetificacao;

implementation

{$R *.DFM}

uses
   uFuncoesImob, uSistema, uModuloImobiliario, dBaseDados, uDataBase, uMensErro;


procedure TfrmExecDesfazRetificacao.molImovelouMestrebtnBuscaImovelClick(Sender: TObject);
begin
   MS_Retifica.Executar;
   if MS_Retifica.RetornouValor then
   begin
      molImovelouMestre.edtImovel.Text := MS_Retifica.ValoresChave[1];
      iImovel                          := StrToInt(MS_Retifica.ValoresChave[0]);
      dDataProcesso                    := StrToDate(MS_Retifica.ValoresChave[2]);

      cdsBem.Close;
      LimpaParametros(qryBem);
      qryBem.ParamByName('PIDIMOVEL').AsInteger      := iImovel;
      qryBem.ParamByName('DDATAPROCESSO').AsDateTime := dDataProcesso;
      qryBem.Open;
      cdsBem.Open;
   end;
end;



procedure TfrmExecDesfazRetificacao.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlEventoImovel   := TCtrlEventoImovel.Create;
   CtrlEventoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CtrlMovReavaliacao := TCtrlMovReavaliacao.Create;
   CtrlMovReavaliacao.InitializeAs( CtrlEventoImovel );

   molImovelouMestrebtnLimpaImovelClick(Self);
end;



procedure TfrmExecDesfazRetificacao.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlEventoImovel );
   FreeAndNil( CtrlMovReavaliacao );
   inherited;
end;



procedure TfrmExecDesfazRetificacao.bbtnConfirmarClick(Sender: TObject);
var
   sErro : String;
begin
   inherited;
   if MsgDlg('Confirma desfazer a retificação?','InvestImob',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      StartTransacao;

      try
         cdsBem.First;
         while not cdsBem.eof do
         begin
            sErro := '';
            CtrlMovReavaliacao.OpenTransaction := False;
            CtrlMovReavaliacao.MessageInfo     := '';
            if not CtrlMovReavaliacao.EstornaRetificaReaval(Sistema.IdModulo,Sistema.IdEmpresa,Sistema.IdUsuario,
                                                            cdsBemIDBEM.AsInteger,cdsBemDATAREAVALIACAO.AsDateTime,
                                                            Date,cdsBemULT_REAVALIACAO.AsDateTime) then
            begin
               sErro := CtrlMovReavaliacao.MessageInfo;
               Raise Exception.Create(sErro);
            end;

            cdsBem.Next;
         end;

         CtrlEventoImovel.OpenTransaction := False;
         if not CtrlEventoImovel.ExcluiEvento(-1,iImovel,-1,-1,-1,'RV',dDataProcesso) then
         begin
            sErro := CtrlEventoImovel.MessageInfo;
            Raise Exception.Create(sErro);
         end;

         LimpaParametros(qryDeletaReavalia);
         qryDeletaReavalia.ParamByName('PIDIMOVEL').AsInteger      := iImovel;
         qryDeletaReavalia.ParamByName('DDATAPROCESSO').AsDateTime := dDataProcesso;
         qryDeletaReavalia.ExecSQL;

         if dtmBaseDados.dbBaseDados.InTransaction then
            CommitTransacao;

         MsgDlg('Retificação desfeita com sucesso','InvestImob',mtInformation,[mbOK],0);            
         molImovelouMestrebtnLimpaImovelClick(Self);

      except
         if dtmBaseDados.dbBaseDados.InTransaction then
            RollBackTransacao;
         MsgDlg(sErro,'InvestImob',mtError,[mbOK],0);
      end;
   end;
end;



procedure TfrmExecDesfazRetificacao.molImovelouMestrebtnLimpaImovelClick(Sender: TObject);
begin
   molImovelouMestre.edtImovel.Text := '';
   iImovel                          := -1;
   dDataProcesso                    := -1;
end;



end.
