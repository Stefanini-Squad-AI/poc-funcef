{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//Nº SIG.............: 130466
//Data da Alteração..: 01/02/2023
//Alteração Form.....: property, formShow
//Responsável........: Lendro Poceobon
//Descrição..........: Testa tipo evento de cobrança 'Processo judial - QUERO-PAGAR' para colocar data e abservação obrigatorio no bloqueio de suspensão.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Nº SOL.............: 224034/17909
Nº PPM.............: 1165556
Data da Alteração..: 05/02/2016
Alteração Form.....: Inclusão de envento atualizando
Responsável........: Darivaldo Alencar
Descrição..........: Desenvolvido form de bloqueio individual
--------------------------------------------------------------------------------}
unit FBloqConcessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery,UMensErro;

type
  TFrmBloqConcessao = class(TfrmOkCancelar)
    edDtFinBloq: TCMDateTimePicker;
    mObsr: TMemo;
    QrySusp: TwwQuery;
    lblDtFimBloqueio: TLabel;
    lblObsr: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fContrato: string;
    fDataFimBloq: string;
    fObseervacao: string;
    fObrigatorio: boolean;
  public

  published
    property sContrato: string read fContrato write fContrato;
    //Leandro Pocebon - SIG130466 - 03/01/2023 - Inicio
    property sDataFimBloq: string  read fDataFimBloq write fDataFimBloq;
    property sObseervacao: string  read fObseervacao write fObseervacao;
    property bObrigatorio: boolean read fObrigatorio write fObrigatorio default false;
    //Leandro Pocebon - SIG130466 - 03/01/2023 - Fim
  end;

var
  FrmBloqConcessao: TFrmBloqConcessao;


implementation

uses FEventoCobrancaContrato;

{$R *.DFM}

procedure TFrmBloqConcessao.bbtnConfirmarClick(Sender: TObject);
var
  sidBenef : String;
begin
     if ((edDtFinBloq.Date <= FrmEventoCobrancaContrato.edtDataEvento.Date) and (edDtFinBloq.Date <> 0)) then
     begin
          MsgDlg('A data final deve ser posterior a data do evento.','Data Inválida',mtWarning,[mbOK], 0);
          Exit;
     end
     else
     begin
         sidBenef := FrmEventoCobrancaContrato.retorna_IDBENEF(sContrato);

         QrySusp.Close;
         QrySusp.SQL.Clear;
         QrySusp.SQL.Add('SELECT COUNT(1) AS RETORNO FROM SUSPCONCESSAO');
         QrySusp.SQL.Add(' WHERE IDPESSOA = :IDPESSOA');
         QrySusp.SQL.Add('   AND SUCDATAINICIO = :SUCDATAINICIO');
         QrySusp.SQL.Add('   AND FLGSTATUS = ''A''');
         QrySusp.ParamByName('IDPESSOA').AsString := sidBenef;
         QrySusp.ParamByName('SUCDATAINICIO').AsString := FormatDateTime('dd/mm/yyyy',now);
         QrySusp.Open;

         if (QrySusp.Fields[0].AsInteger > 0) then
         begin
           MsgDlg('Bloqueio de Concessão Já Inserido para o Contrato', 'Aviso', mtError, [mbOk], 0);
           Exit;
         end;

        try
         QrySusp.Close;
         QrySusp.SQL.Clear;
         QrySusp.SQL.Add('insert into SUSPCONCESSAO(idpessoa,SUCDATAINICIO,SUCDATAFINAL,SUCMOTIVOSUSP,FLGSTATUS,FLGPRAZOINDETERMINADO,IDSUCEMPTMO,IDMOTIVOSUSPCONCESSAO,IDCONTRATOEMPTMO) ');
         QrySusp.SQL.Add('values(:idpessoa,:SUCDATAINICIO,:SUCDATAFINAL,:SUCMOTIVOSUSP,:FLGSTATUS,:FLGPRAZOINDETERMINADO,SEQSUSPCONCESSAO.Nextval,:IDMOTIVOSUSPCONCESSAO,:IDCONTRATOEMPTMO)');
         QrySusp.ParamByName('idpessoa').AsString:= sidBenef;
         QrySusp.ParamByName('SUCDATAINICIO').AsString:= FormatDateTime('dd/mm/yyyy',now);

         if (edDtFinBloq.Date <> 0) then
           QrySusp.ParamByName('SUCDATAFINAL').AsString := FormatDateTime('dd/mm/yyyy',edDtFinBloq.Date)
         else
           QrySusp.ParamByName('SUCDATAFINAL').AsString := '';

         QrySusp.ParamByName('SUCMOTIVOSUSP').AsString:= mObsr.Lines.Text;
         QrySusp.ParamByName('FLGSTATUS').AsString:= 'A';
         if (edDtFinBloq.Date <> 0) then
             QrySusp.ParamByName('FLGPRAZOINDETERMINADO').AsString := 'N'
         else
             QrySusp.ParamByName('FLGPRAZOINDETERMINADO').AsString := 'S';
         QrySusp.ParamByName('IDMOTIVOSUSPCONCESSAO').AsInteger:= 23;
         QrySusp.ParamByName('IDCONTRATOEMPTMO').AsString:= sContrato;
         QrySusp.ExecSQL;
         MsgDlg('Bloqueio de Concessão Inserido','Bloqueio inserido',mtinformation,[mbOK], 0);
         ModalResult := mrOk;
        except on e: Exception do
           MsgDlg('Erro ao atualizar tabela SUSPCONCESSAO: '+e.Message,'Erro',mtError,[mbOK], 0);
        end;
     end;

     inherited;
end;

procedure TFrmBloqConcessao.FormShow(Sender: TObject);
begin
  inherited;
  //Leandro Pocebon - SIG130466 - 03/01/2023 - INICIO
  if (fObrigatorio) then
  begin
    edDtFinBloq.Date := StrToDate(sDataFimBloq);
    mObsr.Lines.add(sObseervacao);
    edDtFinBloq.Enabled := false;
    mObsr.Enabled := false;
    bbtnCancelar.Visible := false;
    bbtnConfirmar.Caption := 'Confirma';
    bbtnConfirmar.SetFocus();

  end;
  //Leandro Pocebon - SIG130466 - 03/01/2023 - FIM
end;

end.
