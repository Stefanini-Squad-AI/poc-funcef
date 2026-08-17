unit fScripAutoriza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, uDataBase, ExtCtrls, ComCtrls, Buttons, IvDictio, IvMulti,
  IvEMulti, TB97, CmDock;

type
    TTipoScript = (stAutoriza, stObjeto);
    TStLeitura = ( slVazio, slTexto, slCreateTable, slAlterTable, slCreateIndex,
                   slCreateSequence, slDropSequence, slFimComando,
                   slProcedure, slFunction, slTrigger);

    TFileScript = class
     FTipo : TTipoScript;
     FqForm ,
     FqFuncao ,
     FqObjeto ,
     FqOperacao ,
     FqOperFunc ,
     FqFrObFnOp ,
     FqModulo : TwwQuery;
     FDialog : TOpenDialog;
     FArqEntra,
     FArqSai : string;
     fLe,
     fGrava : TextFile;
     protected
           property Tipo : TTipoScript read FTipo write FTipo;
           property ArqEntra : string read FArqEntra write FArqEntra;
           property ArqSai   : string read FArqSai write FArqSai;
     private
           function WrapText(const Line, BreakStr: string; MaxCol: Integer): string;
           procedure GeraAutoriza;
           procedure GeraObjeto;
           procedure ScriptDeleta(iIdModulo:integer; sTabela, sChave:string);
           procedure ScriptGera(sTabela:string);
           function Status(sLinha : string): TstLeitura;
           function NomeObjeto(sLinha:string; sTipo : TstLeitura) : string;
           function GravaObjeto(sObjeto, sTipo :string) : boolean;
     public
           procedure Gerar;
           constructor Create;
    end;

  TfrmScriptAutoriza = class(TForm)
    qryModulo: TwwQuery;
    qryOperFunc: TwwQuery;
    qryfrobfnop: TwwQuery;
    qryForm: TwwQuery;
    qryObjeto: TwwQuery;
    qryFuncao: TwwQuery;
    qryOperacao: TwwQuery;
    dsModulo: TwwDataSource;
    qryModuloEscolhe: TwwQuery;
    dsModuloEscolhe: TwwDataSource;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PnlFundo: TPanel;
    Panel1: TPanel;
    dbgModuloEscolhe: TwwDBGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    chkObjetos: TCheckBox;
    grpObjeto: TGroupBox;
    spd1: TSpeedButton;
    lbl1: TLabel;
    spd2: TSpeedButton;
    lbl2: TLabel;
    edScrGeral: TEdit;
    mem1: TMemo;
    edscrObjeto: TEdit;
    grpAutoriza: TGroupBox;
    spd3: TSpeedButton;
    lbl3: TLabel;
    edscrAutoriza: TEdit;
    mem2: TMemo;
    CkbApaga: TCheckBox;
    chkAutoriza: TCheckBox;
    CMOkCancel: TCMOkCancelar;
    procedure dbgModuloEscolheMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure dbgModuloEscolheTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure chkObjetosClick(Sender: TObject);
    procedure chkAutorizaClick(Sender: TObject);
    procedure dbgModuloEscolheDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure spd1Click(Sender: TObject);
    procedure spd2Click(Sender: TObject);
    procedure spd3Click(Sender: TObject);
    procedure edScrGeralChange(Sender: TObject);
    procedure CMOkCancelOkClick(Sender: TObject);
    procedure CMOkCancelSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure PodeGerar;
    procedure AtuModulo(sTipo:string);
  public
    { Public declarations }
    iOrdem : integer;
  end;

var
  frmScriptAutoriza: TfrmScriptAutoriza;

implementation

uses fAguarde;

{$R *.DFM}

// TfrmScriptAutoriza
procedure TfrmScriptAutoriza.dbgModuloEscolheMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
     if Button = mbLeft then
        if dbgModuloEscolhe.IsSelected then
           dbgModuloEscolhe.UnselectRecord
        else
            dbgModuloEscolhe.SelectRecord;

end;
procedure TfrmScriptAutoriza.FormCreate(Sender: TObject);
begin
  inherited;
  qryModuloEscolhe.Open;
  qryModulo.Open;
  qryOperFunc.Open;
  qryFrobFnOp.Open;
  qryForm.Open;
  qryObjeto.Open;
  qryFuncao.Open;
  qryOperacao.Open;
  iOrdem := 1;
end;

procedure TfrmScriptAutoriza.dbgModuloEscolheTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
     inherited;
     qryModuloEscolhe.Close;
     if AFieldName = 'IDMODULO' then
     begin
        qryModuloEscolhe.SQL[2] := 'ORDER BY MODULO.IDMODULO';
        iOrdem := 1;
     end;

     if AFieldName = 'NOMEMODULO' then
     begin
        qryModuloEscolhe.SQL[2] := 'ORDER BY MODULO.NOMEMODULO';
        iOrdem := 2;
     end;
     qryModuloEscolhe.Open;
end;

procedure TfrmScriptAutoriza.AtuModulo(sTipo:string);
var i : integer;
    sSQL : string;
begin
     with dbgModuloEscolhe, qryModuloEscolhe do
     begin
          if sTipo = 'A' then
             sSQl := 'SELECT IDMODULO, NOMEMODULO FROM MODULO WHERE IDMODULO IN (';
          if sTipo = 'O' then
             sSQl := 'SELECT IDMODULO, NOMEOBJETO, TIPOOBJETO FROM CM$_OBJMODULO WHERE IDMODULO IN (';

          DisableControls; {Disable controls to improve performance}
          for i:= 0 to SelectedList.Count-1 do
          begin
	       GotoBookmark(SelectedList.items[i]);
               if i > 0 then
                  sSql := sSql+', ';
               SSQL := sSql+IntToStr(qryModuloEscolhe.FieldByName('IDMODULO').asInteger);
          end;
          sSql := sSql+')';
          if iOrdem = 1 then
             sSql := sSql + ' ORDER BY IDMODULO'
          else
             sSql := sSql + ' ORDER BY NOMEMODULO';

          FazQuery(qryModulo, sSql);
          
          EnableControls;  { Re-enable controls }
     end;
end;


// TFileScript
//////////////
constructor TFileScript.Create;
begin
     inherited;
     FqModulo   := frmScriptAutoriza.qryModulo;
     FqOperacao := frmScriptAutoriza.qryOperacao;
     FqForm     := frmScriptAutoriza.qryForm;
     FqObjeto   := frmScriptAutoriza.qryObjeto;
     FqFuncao   := frmScriptAutoriza.qryFuncao;
     FqOperFunc := frmScriptAutoriza.qryOperFunc;
     FqFrObFnOp := frmScriptAutoriza.qryFrObFnOp;
     FDialog := frmScriptAutoriza.OpenDialog1;
end;

procedure TFileScript.Gerar;
begin
     inherited;
     if FTipo = stAutoriza then
        GeraAutoriza;
     if FTipo = stObjeto then
        GeraObjeto;
end;


procedure TFileScript.GeraAutoriza;
begin
     AssignFile(fGrava, FArqSai);
     ReWrite(fGrava);
     FileMode := 1;
     with FqModulo do
     begin
          WriteLn(fGrava,'-- ###################################################');
          WriteLn(fGrava,'-- Script de atualização das tabelas da visão Segurança');
          WriteLn(fGrava,'-- Gerado em '+FormatDateTime('dd/mm/yyyy hh:mm',Now)+ ' para os módulos: ');
          WriteLn(fGrava,'--');
          first;
          while not eof do
          begin
               WriteLn(fGrava,'-- '+UPPERCASE(FieldByName('NOMEMODULO').AsString));
               next;
          end;
          WriteLn(fGrava,'--');
          WriteLn(fGrava,'-- ###################################################');

          first;
          while not eof do
          begin
               WriteLn(fGrava,'-- Gerando Tabelas do módulo '+UPPERCASE(FieldByName('NOMEMODULO').AsString));
               WriteLn(fGrava,'-- ');

               If frmScriptAutoriza.CkbApaga.Checked Then
               Begin
                  WriteLn(fGrava,' ');
                  WriteLn(fGrava,'-- Desabilitando Constraint "AUTORIZA"');
                  WriteLn(fGrava,'ALTER TABLE AUTORIZA DISABLE CONSTRAINT R_347');
                  WriteLn(fGrava,' ');
               End;

               ScriptDeleta(FieldByName('IDMODULO').AsInteger,'FUNCAO','IDFUNCAO');
               ScriptDeleta(-1,'OPERACAO', 'IDOPERACAO');
               ScriptDeleta(-1,'FORM', 'IDFORM');
               ScriptDeleta(-1,'OBJETO', 'IDOBJETO');
               ScriptDeleta(FieldByName('IDMODULO').AsInteger,'FROBFNOP','');
               ScriptDeleta(FieldByName('IDMODULO').AsInteger,'OPERFUNC','');

               WriteLn(fGrava,'-- GERA MODULO');
               WriteLn(fGrava,'-- DELETE FROM MODULO WHERE IDMODULO = '+IntToStr(FieldByName('IDMODULO').AsInteger)+';');
               WriteLn(fGrava,'INSERT INTO MODULO(IDMODULO, NOMEMODULO) VALUES( '+ IntToStr(FieldByName('IDMODULO').AsInteger)+', '''+ FieldByName('NOMEMODULO').AsString+''');');
               WriteLn(fGrava,'UPDATE MODULO SET NOMEMODULO = '''+ FieldByName('NOMEMODULO').AsString+ ''' WHERE IDMODULO = '+IntToStr(FieldByName('IDMODULO').AsInteger)+';');
               WriteLn(fGrava,'');

               ScriptGera('FUNCAO');
               ScriptGera('OPERACAO');
               ScriptGera('FORM');
               ScriptGera('OBJETO');
               ScriptGera('OPERFUNC');
               ScriptGera('FROBFNOP');

               If frmScriptAutoriza.CkbApaga.Checked Then
               Begin
                  WriteLn(fGrava,' ');
                  WriteLn(fGrava,'-- Deletando Autorizações Duplicadas');
                  WriteLn(fGrava,'DELETE FROM AUTORIZA WHERE IDOPERFUNC NOT IN (SELECT IDOPERFUNC FROM OPERFUNC)');

                  WriteLn(fGrava,'-- Habilitando Constraint "AUTORIZA"');
                  WriteLn(fGrava,'ALTER TABLE AUTORIZA ENABLE CONSTRAINT R_347');

                  WriteLn(fGrava,' ');                  
               End;

               WriteLn(fGrava,'COMMIT;');
               WriteLn(fGrava,'');
               WriteLn(fGrava,'-- Fim do módulo '+UPPERCASE(FieldByName('NOMEMODULO').AsString));
               WriteLn(fGrava,'');
               next;
          end;
          WriteLn(fGrava,'-- Fim do script');
     end;
     CloseFile(fGrava);
     Showmessage('Gravação do arquivo '+FArqSai+' completa.');

end;

procedure TFileScript.ScriptDeleta(iIdModulo:integer; sTabela, sChave:string);
var qDeleta : TwwQuery;
    sLinha : string;
    sComment :String;
begin
     If frmScriptAutoriza.CkbApaga.Checked Then
        sComment := ''
     Else
        sComment := '-- ';

     WriteLn(fGrava,'-- DELETA '+sTabela);
     if iIdmodulo > 0 then
     begin
          if sTabela = 'FROBFNOP' then
             WriteLn(fGrava,sComment + 'DELETE FROM FROBFNOP WHERE FROBFNOP.IDOPERFUNC IN (SELECT IDOPERFUNC FROM OPERFUNC WHERE IDMODULO = '+IntToStr(iIdModulo)+');')
          else
              WriteLn(fGrava,sComment + 'DELETE FROM '+sTabela+' WHERE IDMODULO = '+IntToStr(iIdModulo)+';');
     end
     else
     begin
          if sTabela = 'OPERACAO' then
             qDeleta := FqOperacao
          else if sTabela = 'FORM' then
             qDeleta := FqForm
          else if sTabela = 'OBJETO' then
             qDeleta := FqObjeto;

          with qDeleta do
          begin
               first;
               if not eof then
                  sLinha := sComment + 'DELETE FROM '+sTabela+' WHERE '+sChave +' IN (';

               if not eof then
               begin
                    while not eof do
                    begin
                         sLinha := sLinha + IntToStr(FieldByName(sChave).AsInteger);
                         next;
                         if not eof then
                            sLinha := sLinha+', ';
                    end;

                    sLinha := WrapText(sLinha,#13#10,100);

                    WriteLn(fGrava,sLinha+');');
               end;
          end;
     end;
     WriteLn(fGrava,'COMMIT;');
     WriteLn(fGrava,'');
end;

procedure TFileScript.ScriptGera(sTabela:string);
var qGera : TwwQuery;
    sSql : string;
begin
     with qGera do
     begin
          WriteLn(fGrava,'-- GERA '+sTabela);
          if sTabela = 'FUNCAO' then
             qGera := FqFuncao;

          if sTabela = 'OPERACAO' then
             qGera := FqOperacao;

          if sTabela = 'FORM' then
             qGera := FqForm;

          if sTabela = 'OBJETO' then
             qGera := FqObjeto;

          if sTabela = 'OPERFUNC' then
             qGera := FqOperFunc;

          if sTabela = 'FROBFNOP' then
             qGera := FqFrObFnOp;

          first;
          while not eof do
          begin
               if sTabela = 'FUNCAO' then
                  sSQL := 'INSERT INTO FUNCAO(IDFUNCAO, IDFUNCAOPAI, IDMODULO, NOMEFUNCAO) '+
                          'VALUES( '+ IntToStr(FieldByName('IDFUNCAO').AsInteger)+
                          ', '+IntToStr(FieldByName('IDFUNCAOPAI').AsInteger)+
                          ', '+IntToStr(FieldByName('IDMODULO').AsInteger)+
                          ', '''+ FieldByName('NOMEFUNCAO').AsString+''');';

               if sTabela = 'OPERACAO' then
                  sSQL := 'INSERT INTO OPERACAO(IDOPERACAO, NOMEOPERACAO) '+
                          'VALUES( '+ IntToStr(FieldByName('IDOPERACAO').AsInteger)+
                          ', '''+ FieldByName('NOMEOPERACAO').AsString+''');';

               if sTabela = 'FORM' then
                  sSQL := 'INSERT INTO FORM(IDFORM, IDMODULO, NOMEFORM) '+
                          'VALUES( '+ IntToStr(FieldByName('IDFORM').AsInteger)+
                          ', '+ IntToStr(FieldByName('IDMODULO').AsInteger)+
                          ', '''+ FieldByName('NOMEFORM').AsString+''');';

               if sTabela = 'OBJETO' then
                  sSQL := 'INSERT INTO OBJETO(IDOBJETO, NOMEOBJETO) '+
                          'VALUES( '+ IntToStr(FieldByName('IDOBJETO').AsInteger)+
                          ', '''+ FieldByName('NOMEOBJETO').AsString+''');';

               if sTabela = 'OPERFUNC' then
                  sSQL := 'INSERT INTO OPERFUNC(IDOPERFUNC, IDMODULO, IDOPERACAO, IDFUNCAO) '+
                         'VALUES( '+ IntToStr(FieldByName('IDOPERFUNC').AsInteger)+
                         ', '+ IntToStr(FieldByName('IDMODULO').AsInteger)+
                         ', '+ IntToStr(FieldByName('IDOPERACAO').AsInteger)+
                         ', '+ IntToStr(FieldByName('IDFUNCAO').AsInteger)+');';

               if sTabela = 'FROBFNOP' then
                  sSQL := 'INSERT INTO FROBFNOP(IDOPERFUNC, IDFORM, IDOBJETO) '+
                          'VALUES( '+ IntToStr(FieldByName('IDOPERFUNC').AsInteger)+
                          ', '+ IntToStr(FieldByName('IDFORM').AsInteger)+
                          ', '+ IntToStr(FieldByName('IDOBJETO').AsInteger)+');';

               WriteLn(fGrava,sSql);
               next;
          end;
          WriteLn(fGrava,'');
     end;
end;

procedure TfrmScriptAutoriza.PodeGerar;
begin
     inherited;
     CMOkCancel.Buttons.BtnOk.Enabled := true;
     if ((chkObjetos.Checked) or (chkAutoriza.Checked)) and
        (dbgModuloEscolhe.SelectedList.Count>0) then
     begin
          if (chkObjetos.Checked) and
             ((edscrGeral.Text = '' ) or (edscrObjeto.Text = '')) then
             CMOkCancel.Buttons.BtnOk.Enabled := false;
          if (chkAutoriza.Checked) and
             (edscrAutoriza.Text = '' ) then
             CMOkCancel.Buttons.BtnOk.Enabled := false;
     end
     else
         CMOkCancel.Buttons.BtnOk.Enabled := false;
end;

procedure TfrmScriptAutoriza.chkObjetosClick(Sender: TObject);
begin
  inherited;
  PodeGerar;
  grpObjeto.Enabled := chkObjetos.Checked;
  lbl1.Enabled := chkObjetos.Checked;
  lbl2.Enabled := chkObjetos.Checked;
  spd1.Enabled := chkObjetos.Checked;
  spd2.Enabled := chkObjetos.Checked;
  mem1.Enabled := chkObjetos.Checked;
end;

procedure TfrmScriptAutoriza.chkAutorizaClick(Sender: TObject);
begin
  inherited;
  PodeGerar;
  grpAutoriza.Enabled := chkAutoriza.Checked;
  lbl3.Enabled := chkAutoriza.Checked;
  spd3.Enabled := chkAutoriza.Checked;
  mem2.Enabled := chkAutoriza.Checked;

end;

procedure TfrmScriptAutoriza.dbgModuloEscolheDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
     PodeGerar;

end;

procedure TfrmScriptAutoriza.spd1Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
     edscrGeral.Text := OpenDialog1.FileName;
end;

procedure TfrmScriptAutoriza.spd2Click(Sender: TObject);
begin
  inherited;
  with SaveDialog1 do
  begin
       Title := 'Script de criação de objetos';
       FileName := 'IniObjetosCM.sql';
       if Execute then
          edscrObjeto.text := FileName;
  end;
end;

procedure TfrmScriptAutoriza.spd3Click(Sender: TObject);
begin
  inherited;
  with SaveDialog1 do
  begin
       Title := 'Script dos dados de autorização';
       FileName := 'IniAutorização.sql';
       if Execute then
          edscrAutoriza.text := FileName;
  end;
end;

procedure TfrmScriptAutoriza.edScrGeralChange(Sender: TObject);
begin
  inherited;
  PodeGerar;
end;

function TFileScript.Status(sLinha : string): TstLeitura;
var sUpperLinha : string;
begin
     sUpperLinha := UPPERCASE(sLinha);
     if sLinha = '' then
        Result := slVazio
     else if Pos('CREATE TABLE', sUpperLinha) > 0 then
          Result := slCreateTable
     else if Pos('ALTER TABLE', sUpperLinha) > 0 then
          Result := slAlterTable
     else if (Pos('CREATE INDEX', sUpperLinha) > 0) or
             (Pos('CREATE UNIQUE INDEX', sUpperLinha) > 0) then
          Result := slCreateIndex
     else if (Pos('DROP SEQUENCE', sUpperLinha) > 0) then
          Result := slDropSequence
     else if (Pos('CREATE SEQUENCE', sUpperLinha) > 0) then
          Result := slCreateSequence
     else if (Pos('CREATE OR REPLACE PROCEDURE', sUpperLinha) > 0) then
          Result := slProcedure
     else if (Pos('CREATE OR REPLACE FUNCTION', sUpperLinha) > 0) then
          Result := slFunction
     else if (Pos('CREATE TRIGGER', sUpperLinha) > 0) then
          Result := slTrigger
     else if Pos(';', sUpperLinha) > 0 then
          Result := slFimComando
     else
         Result := slTexto;
end;


procedure TFileScript.GeraObjeto;
var sLinha : string;
    statusLinha: TstLeitura;
    lGrava : boolean;
    sNomeObjeto, sTipo : string;
    iProgress : integer;
begin
     frmAguarde.Mostra('Gerando script de criação de objetos...');
     try
        AssignFile(FLe, FArqEntra);
        Reset(FLe);
        FileMode := 0;
        // Conta o numero de Linhas
        iProgress := 0;
        while not eof(FLe) do
        begin
             ReadLn(FLe, sLinha);
             Inc(iProgress);
        end;
        CloseFile(FLe);
        AssignFile(FLe, FArqEntra);
        Reset(FLe);
        FileMode := 0;

        frmAguarde.Max := iProgress;
        iProgress := 0;

        AssignFile(FGrava, FArqSai);
        Rewrite(FGrava);
        FileMode := 0;
        lGrava := false;
        while not eof(FLe) do
        begin
             ReadLn(FLe, sLinha);
             statusLinha := Status(sLinha);

             if not (statusLinha in [slVazio, slTexto, slFimComando, slCreateIndex]) then
             begin
                  if statusLinha in [slCreateTable, slAlterTable] then
                     sTipo := 'T';
                  if statusLinha in [slCreateSequence, slDropSequence] then
                     sTipo := 'S';
                  if statusLinha = slProcedure then
                     sTipo := 'P';
                  if statusLinha = slFunction then
                     sTipo := 'F';
                  if statusLinha = slTrigger then
                     sTipo := 'T';
                  sNomeObjeto := NomeObjeto(sLinha, statusLinha);
                  if statusLinha = slDropSequence then
                     statusLinha := slFimComando;
                  lGrava := GravaObjeto(sNomeObjeto,sTipo);
             end;

             if lGrava then
             begin
                  WriteLn(Fgrava, sLinha);
                  if statusLinha = slFimComando then
                     WriteLn(Fgrava, '');
             end;
             Inc(iProgress);
             frmAguarde.Pos := iProgress;
        end;
        CloseFile(Fgrava);
        CloseFile(FLe);
     finally
            frmAguarde.Apaga;
     end;
     ShowMessage('Gravação do arquivo '+FArqSai+' completa.');
end;

function TFileScript.NomeObjeto(sLinha:string; sTipo : TstLeitura) : string;
var IniPos, FimPos : integer;
begin
     Result := '';
     case sTipo of
          slCreateTable :
          begin
               IniPos := Pos('TABLE', UPPERCASE(sLinha))+6;
               FimPos := Pos('(', UPPERCASE(sLinha));
          end;
          slAlterTable :
          begin
               IniPos := Pos('TABLE', UPPERCASE(sLinha))+6;
               FimPos := Length(sLinha);
          end;
          slCreateSequence :
          begin
               IniPos := Pos('SEQUENCE', UPPERCASE(sLinha))+9;
               FimPos := Length(sLinha);
          end;
          slDropSequence :
          begin
               IniPos := Pos('SEQUENCE', UPPERCASE(sLinha))+9;
               FimPos := Pos(';', UPPERCASE(sLinha));
          end;
          slProcedure :
          begin
               IniPos := Pos('PROCEDURE', UPPERCASE(sLinha))+10;
               FimPos := Pos('(', UPPERCASE(sLinha));
          end;
          slFunction :
          begin
               IniPos := Pos('FUNCTION', UPPERCASE(sLinha))+9;
               FimPos := Pos('(', UPPERCASE(sLinha));
          end;
          slTrigger :
          begin
               IniPos := Pos(' ON ', UPPERCASE(sLinha))+4;
               FimPos := Pos(' FOR ', UPPERCASE(sLinha));
          end;
     end;
     Result := TRIM(UPPERCASE(Copy(sLinha,IniPos,(FimPos-IniPos))));
end;

function TFileScript.GravaObjeto(sObjeto, sTipo :string) : boolean;
begin
     Result := FqModulo.Locate('NOMEOBJETO;TIPOOBJETO',VarArrayOf([sObjeto, sTipo]),[loPartialKey,loCaseInsensitive]);
end;

function TFileScript.WrapText(const Line, BreakStr: string; MaxCol: Integer): string;
const
  QuoteChars = ['''', '"'];
  BreakChars = ['-',' ',#9,','];
var
  Col, Pos: Integer;
  LinePos, LineLen: Integer;
  BreakLen, BreakPos: Integer;
  QuoteChar, CurChar: Char;
  ExistingBreak: Boolean;
begin
  Col := 1;
  Pos := 1;
  LinePos := 1;
  BreakPos := 0;
  QuoteChar := ' ';
  ExistingBreak := False;
  LineLen := Length(Line);
  BreakLen := Length(BreakStr);
  Result := '';
  while Pos <= LineLen do
  begin
    CurChar := Line[Pos];
    if CurChar in LeadBytes then
    begin
      Inc(Pos);
      Inc(Col);
    end else
      if CurChar = BreakStr[1] then
      begin
        if QuoteChar = ' ' then
        begin
          ExistingBreak := CompareText(BreakStr, Copy(Line, Pos, BreakLen)) = 0;
          if ExistingBreak then
          begin
            Inc(Pos, BreakLen-1);
            BreakPos := Pos;
          end;
        end
      end
      else if CurChar in BreakChars then
      begin
        if QuoteChar = ' ' then BreakPos := Pos
      end
      else if CurChar in QuoteChars then
        if CurChar = QuoteChar then
          QuoteChar := ' '
        else if QuoteChar = ' ' then
          QuoteChar := CurChar;
    Inc(Pos);
    Inc(Col);
    if not (QuoteChar in QuoteChars) and (ExistingBreak or
      ((Col > MaxCol) and (BreakPos > LinePos))) then
    begin
      Col := Pos - BreakPos;
      Result := Result + Copy(Line, LinePos, BreakPos - LinePos + 1);
      if not (CurChar in QuoteChars) then
        while (Pos <= LineLen) and (Line[Pos] in BreakChars + [#13, #10]) do Inc(Pos);
      if not ExistingBreak and (Pos < LineLen) then
        Result := Result + BreakStr;
      Inc(BreakPos);
      LinePos := BreakPos;
      ExistingBreak := False;
    end;
  end;
  Result := Result + Copy(Line, LinePos, MaxInt);
end;


procedure TfrmScriptAutoriza.CMOkCancelOkClick(Sender: TObject);
var script : TFileScript;
begin
  inherited;
  script := TFileScript.Create;
  with script do
  begin
       if chkObjetos.Checked then
       begin
            AtuModulo('O');
            Tipo := stObjeto;
            ArqEntra := edscrGeral.Text;
            ArqSai   := edscrObjeto.Text;
            Gerar;
       end;
       if chkAutoriza.Checked then
       begin
            AtuModulo('A');
            Tipo := stAutoriza;
            ArqEntra := '';
            ArqSai   := edscrAutoriza.Text;
            Gerar;
       end;
       free;
  end;
end;

procedure TfrmScriptAutoriza.CMOkCancelSairClick(Sender: TObject);
begin
  close;
end;

end.
