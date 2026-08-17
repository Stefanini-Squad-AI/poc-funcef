unit fCadMotivosBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadMotivosBaixa = class(TfrmCadastroCS)
    qryIDMOTIVOBAIXA: TFloatField;
    qryDESCMOTIVOBAIXA: TStringField;
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    sTipoBaixa : String;
  public
    { Public declarations }
  end;

var
  frmCadMotivosBaixa: TfrmCadMotivosBaixa;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;


procedure TfrmCadMotivosBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Text := 'SELECT * FROM ' + Sistema.PrefixoServidor + 'MOTIVOBAIXA ORDER BY DESCMOTIVOBAIXA';
   try
      qry.Open;
   except
      MsgDlg('Problema na abertura da tabela MOTIVOBAIXA','Erro',mtError,[mbOk],0);
      exit;
   end;
end;

procedure TfrmCadMotivosBaixa.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.RetornouValor) then
   begin
      sTipoBaixa := MontaSelect.ValoresChave[0];
      qry.Locate('IDMOTIVOBAIXA', strtoint(sTipoBaixa),[]);
   end;
end;

procedure TfrmCadMotivosBaixa.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbedDescricao.Text) = '' then
   begin
     MsgDlg('Obrigatório preencher o Motivo da Baixa','Erro',mtError,[mbOK],0);
     dbedDescricao.SetFocus;
     exit;
   end;
   if qry.FieldByName('IDMOTIVOBAIXA').AsInteger <= 0 then
      qry.FieldByName('IDMOTIVOBAIXA').AsInteger := LeUltRegistro(nil,'MOTIVOBAIXA');
   inherited;
end;

procedure TfrmCadMotivosBaixa.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Motivo para Baixa de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Motivo para Baixa de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Motivo para Baixa de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
