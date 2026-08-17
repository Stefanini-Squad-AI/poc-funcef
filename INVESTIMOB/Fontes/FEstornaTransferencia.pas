{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 172902/8222
Responsável  : Wylliam Leite da Silva
Data         : 04/04/2012
Descrição    : Bloqueio para data bloqueada na contabilidade
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 21/05/2007
Descrição   : Ajuste no estorno da transferência do Tipo do Imóvel para refletir
              também na Unidade...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FEstornaTransferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, mImovelAtivo, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlMovTransfBem,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;


type
  TfrmEstornaTransferencia = class(TfrmOkCancelar)
    molImovelAtivo1: TmolImovelAtivo;
    qryTransferencia: TwwQuery;
    GroupBox1: TGroupBox;
    edDataEstorno: TCMDateTimePicker;
    Panel5: TPanel;
    qryTransferenciaDESBEM: TStringField;
    qryTransferenciaIDMOVIMENTACAO: TFloatField;
    qryTransferenciaCODTIPIMOVELANT: TStringField;
    qryTransferenciaIDBEM: TFloatField;
    qryTransferenciaDATAMOVIMENTACAO: TDateTimeField;
    dsTransferencia: TwwDataSource;
    qryTransferenciaIDIMOVELORIG: TFloatField;
    updTransferencia: TUpdateSQL;
    qryTransferenciaFLGESTORNO: TFloatField;
    grdTransf: TwwDBGrid;
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdTransfDblClick(Sender: TObject);
  private
    { Private declarations }

    CtrlMovTransfBem : TCtrlMovTransfBem;
    CtrlContab  : TCtrlContab;// Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    function VerificaExclusao : Boolean;
    function DesfazTransferencia : Boolean;
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
  public
    { Public declarations }
  end;

var
  frmEstornaTransferencia: TfrmEstornaTransferencia;

implementation

{$R *.DFM}
uses
   uSistema, uModuloInvestImob, dImobiliario, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, DMS, DCAF;

procedure TfrmEstornaTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlMovTransfBem := TCtrlMovTransfBem.Create;
   CtrlMovTransfBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                    ComunsImobiliario.MensErroMT);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlMovTransfBem);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmEstornaTransferencia.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovTransfBem );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  inherited;
end;


procedure TfrmEstornaTransferencia.molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovelAtivo1.btnBuscaImovelClick(Sender);
  if molImovelAtivo1.iImovel > 0 then begin
     LimpaParametros( qryTransferencia );
     qryTransferencia.ParamByName('PIDIMOVEL').AsInteger := molImovelAtivo1.iImovel;
     qryTransferencia.Open;
  end;
end;

procedure TfrmEstornaTransferencia.bbtnCancelarClick(Sender: TObject);
begin
   if VerificaExclusao then begin
      DesabilitaBotoes;
      try
         StartTransacao;
         if DesfazTransferencia then begin
            CommitTransacao;
            MsgDlg('Trasferência desfeita com sucesso!', 'Informação', mtInformation, [mbOk], 0);

            LimpaParametros( qryTransferencia );
            qryTransferencia.ParamByName('PIDIMOVEL').AsInteger := molImovelAtivo1.iImovel;
            qryTransferencia.Open;

         end else begin
            Abort;
         end;
      except
         RollBackTransacao;
         Raise;
         Repaint;
         MsgDlg('Ocorreram ERROS durante a tentativa de desfazer a Transferência', 'Erro', mtError, [mbOk], 0);
         Repaint;
      end;
      HabilitaBotoes;
   end;
end;

function TfrmEstornaTransferencia.VerificaExclusao: Boolean;
var bMarcado: Boolean;
    dDataTransf : TDateTime;
begin
   Result := True;
   if molImovelAtivo1.iImovel < 1 then begin
      MsgDlg('Selecione o Imóvel que foi transferido', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if qryTransferencia.IsEmpty then begin
      MsgDlg('Não existem Transferências para o imóvel selecionado', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if edDataEstorno.Text = '' then begin
      MsgDlg('Informe a data de estorno da transferência', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataEstorno.Text) then
  begin
       Result := False;
       exit;
  end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   if MsgDlg('Confirma a Exclusão da Transferência ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;

function TfrmEstornaTransferencia.DesfazTransferencia: Boolean;
var iIdImovel : Integer;
    sTipoAnt, sData, sSql  : String;
begin
   Result := True;
   try
      // Estorna transferencia no CAF
      qryTransferencia.First;
      while not qryTransferencia.Eof do begin
         if qryTransferenciaFLGESTORNO.AsInteger = 1 then begin

            sSql := 'DELETE FROM TRANSFBEMIMOVEL '+#13+
                    ' WHERE IDMOVIMENTACAO = ' + qryTransferenciaIDMOVIMENTACAO.AsString;
            if not ExecutarQuery(dtmBaseDados.qry, sSql ) then
               raise exception.Create('Erro ao excluir em TRANSFBEMIMOVEL');

            CtrlMovTransfBem.OpenTransaction := False;
            if not CtrlMovTransfBem.EstornaTransferencia(Sistema.IdModulo,
                                                         Sistema.IdEmpresa,
                                                         Sistema.IdUsuario,
                                                         qryTransferenciaIDBEM.AsInteger,
                                                         qryTransferenciaDATAMOVIMENTACAO.AsDateTime,
                                                         edDataEstorno.Date,
                                                         qryTransferenciaIDMOVIMENTACAO.AsInteger) then
               raise exception.create( CtrlMovTransfBem.MessageInfo );


            iIdImovel := qryTransferenciaIDIMOVELORIG.AsInteger;
            sTipoAnt  := qryTransferenciaCODTIPIMOVELANT.AsString;
            sData     := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',qryTransferenciaDATAMOVIMENTACAO.AsDateTime)) + ',''DD/MM/YYYY'') ';
         end;
         qryTransferencia.Next;
      end;

      if iIdImovel>0 then begin
        sSql := 'DELETE FROM EVENTOIMOVEL '      +#13+
                ' WHERE FLGTIPOEVENTO = ''TT'' ' +#13+
                '   AND EVIDATA  = '       +sDAta+#13+
                '   AND IDIMOVEL = '       +IntToStr(iIdImovel);

        if not ExecutarQuery(dtmBaseDados.qry,sSql) then
          raise exception.Create('Erro ao Excluir o Evento de Transferencia do Imóvel');

        sSql := 'UPDATE IMOVEL SET CODTIPIMOVEL = ' +QuotedStr(sTipoAnt)+#13+
                ' WHERE IDIMOVEL = '                +IntToStr(iIdImovel);

        if not ExecutarQuery(dtmBaseDados.qry, sSql ) then
          raise exception.Create('Erro ao atualizar o tipo de imóvel');

// Daniel - 24085 - Início -----------------------------------------------------
        sSql := 'UPDATE IMOVEL SET CODTIPIMOVEL = '+QuotedStr(sTipoAnt) +#13+
                'WHERE FLGTIPOIMOVEL = 2 '                              +#13+
                '  AND IDIMOVELPAI   = '+QuotedStr(IntToStr(iIdImovel));

        if not ExecutarQuery(dtmBaseDados.qry,sSql) then
          raise exception.Create('Erro ao atualizar o Tipo de Imóvel da Unidade.');
// Daniel - 24085 - Fim --------------------------------------------------------
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



procedure TfrmEstornaTransferencia.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;

procedure TfrmEstornaTransferencia.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;

procedure TfrmEstornaTransferencia.grdTransfDblClick(Sender: TObject);
begin
  inherited;
   // Marca ou Desmarca
   if not qryTransferencia.IsEmpty then begin
      qryTransferencia.Edit;
      qryTransferenciaFLGESTORNO.AsInteger := (qryTransferenciaFLGESTORNO.AsInteger Xor 1);
      qryTransferencia.Post;
   end;
end;

end.
