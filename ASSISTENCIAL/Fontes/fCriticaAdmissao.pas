unit fCriticaAdmissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, URegra, Db, DBTables, Wwquery;

type
  TfrmCriticaAdmissao = class(TfrmOkCancelar)
    rgTipo: TRadioGroup;
    mResultado: TMemo;
    qryRegra1: TwwQuery;
    qryRegraTit: TwwQuery;
    Regra: TRegra;
    lbProgresso: TLabel;
    Label1: TLabel;
    qryRegraDep: TwwQuery;
    qryRegra2: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CriticaPodeSerBeneficiario;
    procedure CriticaPodeSerParticipante;
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriticaAdmissao: TfrmCriticaAdmissao;

implementation

uses UAdmAss;

{$R *.DFM}

procedure TfrmCriticaAdmissao.CriticaPodeSerBeneficiario;
var i, n: integer;
    sTot: string;
begin
  with qryRegradEP do
  begin
    close;
    open;
    if isEmpty then
    begin
      mResultado.Text := 'ATENÇÃO: não foi encontrado nenhum beneficiário a ser analisado.';
    end
    else
    begin
      mResultado.Text := '';
      sTot := '/'+intToStr(recordCount);
      i := 0; n := 0;
      while not eof do
      begin
        inc(i);
        lbProgresso.Caption := intToStr(i) + sTot;
        Application.ProcessMessages;

        regra.rulename := fieldByName('IDREGRABENEFICIA').AsString;
        (*case strToInt(fieldByName('IDREGRABENEFICIA').AsString) of
             47: regra.rulename := '19325';
          10002: regra.rulename := '19326';
          else begin
                 mResultado.Text := mResultado.Text+
                                    'Regra inválida: '+fieldByName('IDREGRABENEFICIA').AsString;
                 exit;
               end;
        end; *)

        regra.queryIn := qryRegra2;
        qryRegra2.Close;
        qryRegra2.ParamByName('IDDEPENDENTE').Value := fieldByName('IDDEPENDENTE').asInteger;;
        qryRegra2.ParamByName('IDTITULAR').Value    := fieldByName('IDTITULAR').asInteger;;
        qryRegra2.ParamByName('IDPLANASS').Value    := fieldByName('IDPLANASS').asInteger;
        qryRegra2.ParamByName('IDPLANOPREV').Value  := fieldByName('IDPLANOPREV').asInteger;
        qryRegra2.ParamByName('IDPESSJUR').Value    := fieldByName('IDPESSJUR').asInteger;
        qryRegra2.ParamByName('DTINSCRICAO').Value  := DateToStr(fieldByName('DATAENTRADA').asDateTime);
        qryRegra2.open;

        regra.execute;
        if (regra.result <> 'True') and (regra.result <> '') then
        begin
          inc(n);
          mResultado.Text := mResultado.Text+
                             '______________________________________ '+
                             intToStr(n)+CRLF+
                             'ERRO: '         +regra.result+CRLF+
                             'PATROCINADORA: '+trim(fieldByName('NOMEPATRO').asString)+CRLF+
                             'PLANO: '        +trim(fieldByName('NOMEPLANO').asString)+CRLF+
                             'TITULAR: '      +trim(fieldByName('NOMETIT').asString)+CRLF+
                             'DEPENDENTE: '   +trim(fieldByName('NOMEDEP').asString)+CRLF+
                             'DEPENDÊNCIA: '  +trim(fieldByName('DEPENDENCIA').asString)+CRLF;
          Application.ProcessMessages;
        end;
        next;
      end;
      if (n = 0) then
        mResultado.Text := '______________________________________ '+CRLF+
                           'NENHUM ERRO ENCONTRADO';
      mResultado.Text := 'Registros analisados: '+intToStr(recordCount)+CRLF+
                         mResultado.Text;
      close;
    end;
  end;
end;

procedure TfrmCriticaAdmissao.CriticaPodeSerParticipante;
var i, n: integer;
    sTot: string;
begin
  with qryRegraTit do
  begin
    close;
    open;
    if isEmpty then
    begin
      mResultado.Text := 'ATENÇÃO: não foi encontrado nenhum participante a ser analisado.';
    end
    else
    begin
      mResultado.Text := '';
      sTot := '/'+intToStr(recordCount);
      i := 0; n := 0;
      while not eof do
      begin
        inc(i);
        lbProgresso.Caption := intToStr(i) + sTot;
        Application.ProcessMessages;
        regra.rulename := fieldByName('IDREGRAADMISSAO').AsString;
        regra.queryIn := qryRegra1;

        qryRegra1.Close;
        qryRegra1.ParamByName('FLGPARTBENEF').Value := fieldByName('FLGPARTBENEF').asInteger;;
        qryRegra1.ParamByName('IDPESSOA').Value     := fieldByName('IDPESSOA').asInteger;
        qryRegra1.ParamByName('IDPLANOPREV').Value  := fieldByName('IDPLANOPREV').asInteger;
        qryRegra1.ParamByName('IDPESSJUR').Value    := fieldByName('IDPESSJUR').asInteger;
        qryRegra1.open;

        regra.execute;
        if (regra.result = 'False') then
        begin
          inc(n);
          mResultado.Text := '______________________________________ '+
                             intToStr(n)+CRLF+
                             'PATROCINADORA: '+fieldByName('NOMEPATRO').asString+CRLF+
                             'PLANO: '        +fieldByName('NOMEPLANO').asString+CRLF+
                             'NOME: '         +fieldByName('NOMEPARTIC').asString+CRLF+
                             mResultado.Text;
          Application.ProcessMessages;
        end;
        next;
      end;
      if (n = 0) then
        mResultado.Text := '______________________________________ '+CRLF+
                           'NENHUM ERRO ENCONTRADO';
      mResultado.Text := 'Registros analisados: '+intToStr(recordCount)+CRLF+
                         mResultado.Text;
      close;
    end;
  end;
end;


procedure TfrmCriticaAdmissao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  case rgTipo.itemIndex of
    0: CriticaPodeSerParticipante;
    1: CriticaPodeSerBeneficiario;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCriticaAdmissao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  mResultado.Text := '';
end;

end.
