{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }    
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uSequence;

interface

uses sysutils, dbTables, wwQuery, windows, classes, extctrls, Db, uSistema;

type
    TQrySeq = class(TwwQuery)
    public
       Constructor Create(AOwner: TComponent); override;
    end;

    TSequence = class(TComponent)
     private
        FNome : string;
        TimerSeq : TTimer;
        _DataBaseName: string;
        _SessionName: String;
        function GetMaximo : integer;
        function GetMinimo : integer;
        function GetIncremento : integer;
        function GetTemMaximo : boolean;
        function GetCircular : boolean;
        function GetProximo : integer;
        function GetAtual   : integer;
        function GetInteger( coluna : string) : integer;
        procedure SetMaximo( v : integer);
        procedure SetMinimo( v : integer);
        procedure SetIncremento( v : integer);
        procedure SetTemMaximo( v : boolean);
        procedure SetCircular( v : boolean);
        procedure SetInteger( v : integer; coluna : string);
        procedure SetAtual( v : integer);
        function MudaAtual( v : integer) : integer;

    public
        constructor Cria(NomedoSequence, NomedoBanco : string; sSessionName: String = '');  
        destructor Destroy; override;

        procedure CriaNoBanco(ValorInicial : integer);
        procedure Trava;
        procedure Libera;
        procedure TLibera(Sender:TObject);

        property Nome       : string read FNome;
        property Proximo    : integer read GetProximo;
        property Atual      : integer read GetAtual write SetAtual;
        property Maximo     : integer read GetMaximo write SetMaximo;
        property Minimo     : integer read GetMinimo write SetMinimo;
        property TemMaximo  : boolean read GetTemMaximo write SetTemMaximo;
        property Incremento : integer read GetIncremento write SetIncremento;
        property Circular   : boolean read GetCircular write SetCircular;
     end;

    TSemaforo = class
    private
        FNome : string;
        FExiste : Boolean;
        FQry : TwwQuery;
        procedure SetNome(n:string);
    public
        constructor Create(Nome:string; q : TwwQuery);
        destructor Destroy; override;
        Property Nome : string read FNome write FNome;
        property Existe : boolean read FExiste write FExiste;
    end;

    TSeqOracle = class
     private
        FNome : string;
        FSemaforo : TSemaforo;
        FExiste : Boolean;
        FControlaSequence : Boolean;

        Fqry    : TwwQuery;
        TimerSeq : TTimer;
        procedure SetNome(n:string);
        function GetMaximo : real;
        function GetProximo : integer;
        function GetAtual   : integer;
        function GetIniFaixaSequence: real;
        function GetFaixaSeqCentraliza(Var rValorIni, rValorFin: LongInt):Boolean;
    public
        constructor Create(NomedoSequence, NomedoBanco : string; sSessionName: String = '');
        destructor Destroy; override;
        procedure CriaNoBanco(ValorInicial : integer);
        procedure Trava;
        procedure Libera;
        procedure TLibera(Sender:TObject);
        function Altera( iMin, iMax, iIni : integer) : Boolean;

        property Nome     : string read FNome write SetNome;
        property Semaforo : TSemaforo read FSemaforo;
        property Existe   : boolean read FExiste;
        property Proximo  : integer read GetProximo;
        property Atual    : integer read GetAtual;
        property Maximo   : real read GetMaximo;

        property Query    : TwwQuery read FQry;
        Property ControlaSequence :Boolean read FControlaSequence;
     end;



implementation

uses uDataBase, dBaseDados, forms, dialogs, uCMFileUtils, uCMSql50;

function FormatSql(sSQl: String): String;
Begin
 Case iTipoBD_Padrao of
   0: Result := UpperCase(sSql);
   1, 2, 3, 4: Result := LowerCase(sSql);
 End;
End;


constructor TSemaforo.Create(Nome:string; q : TwwQuery);
begin
   inherited Create;
   FQry := Q;
   SetNome(Nome);
end;

destructor TSemaforo.Destroy;
begin
     inherited Destroy;
end;

procedure TSemaforo.SetNome(n:string);
begin
     if FNome <> n then FNome := n;

     FExiste := True;

     FExiste := FazQuery(Fqry, FormatSql('SELECT NOMESEQ FROM FAIXASEQUENCE '+
                               'WHERE NOMESEQ = '''+ Trim(Copy(FNome, 4, 50))+''''));


     if not Sistema.UsuarioUnico then
     begin
        if FExiste and (not FazQuery( FQry, FormatSql('SELECT SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+FNome+''''))) then
        begin
             ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 MAXVALUE 1 MINVALUE 0 CYCLE NOCACHE ORDER'+
                                 ' START WITH 1'));
             ExecutarQuery(Fqry, FormatSql('CREATE PUBLIC SYNONYM '+FNome+' FOR CM.'+FNome));
        end;
     end
     else
     begin
        if FExiste and (not FazQuery( FQry, FormatSql('SELECT SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+FNome+''''))) then
        begin
             ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE ' + Sistema.Owner + '.' + FNome + ' INCREMENT BY 1 MAXVALUE 1 MINVALUE 0 CYCLE NOCACHE ORDER'+
                                 ' START WITH 1'));
             ExecutarQuery(Fqry, FormatSql('CREATE PUBLIC SYNONYM '+FNome+' FOR '+ Sistema.Owner + '.' + FNome));
        end;
     end;

end;


constructor TSeqOracle.Create(NomedoSequence, NomedoBanco : string; sSessionName: String = '');

begin
     inherited Create;



     
     TimerSeq := TTimer.Create(nil);
     TimerSeq.Enabled := false;
     TimerSeq.Interval := 60000;
     TimerSeq.OnTimer := TLibera;
     FQry := TwwQuery.Create(nil);
     FQry.DatabaseName := NomedoBanco;
     FQry.SessionName := sSessionName;



     SetNome(NomedoSequence);


     FSemaforo := TSemaforo.Create('SMF' + FNome, FQry);


end;

destructor TSeqOracle.Destroy;
begin
     Libera;

     FSemaforo.Free ;
     Fqry.free;
     TimerSeq.free;
     inherited Destroy;
end;

procedure TSeqOracle.SetNome(n:string);
begin
     if FNome <> n then
     begin
          FNome := n;
     end;


     FExiste := True;
     FControlaSequence := False;


end;

procedure TSeqOracle.CriaNoBanco(ValorInicial : integer);
Var
  rValorIni, rValorFin: LongInt;
begin
     try
        rValorIni := 0;
        rValorFin := 0;

        If GetFaixaSeqCentraliza(rValorIni, rValorFin) Then
        Begin
          If (rValorIni > 0) And (rValorFin > 0) Then
              ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE START WITH '+ IntToStr(rValorIni) + ' MAXVALUE ' + IntToStr(rValorFin)))
          Else
            If (rValorIni > 0) Then
                ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE START WITH '+ FloatToStr(rValorIni)))
            Else
                ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE START WITH '+IntToStr(ValorInicial)));
        End
        Else
        begin
          if not Sistema.UsuarioUnico then
             ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE START WITH '+IntToStr(ValorInicial)))
          else
             ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE '+Sistema.Owner + '.' + FNome+' INCREMENT BY 1 NOCACHE START WITH '+IntToStr(ValorInicial)))
        end;

        Try
          if not Sistema.UsuarioUnico then
             ExecutarQuery(Fqry, FormatSql('CREATE PUBLIC SYNONYM '+FNome+' FOR CM.'+FNome+''))
          else
             ExecutarQuery(Fqry, FormatSql('CREATE SYNONYM '+Sistema.UserUnico + '.'+FNome+' FOR '+ Sistema.Owner+'.'+FNome+''))

        Except

        End;

        FExiste := true;
        Semaforo.Nome := 'SMF'+FNome;
     except

     end;
end;

// Trava a utilização de um sequence para uma única máquina
procedure TSeqOracle.Trava;
var iTrava : integer;
begin

     if (Semaforo.Existe) then
     begin
          try
             TimerSeq.Enabled := true;
             repeat
                   if not Sistema.UsuarioUnico then
                      FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+Semaforo.Nome+''''))
                   else
                      FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+Semaforo.Nome+''''));
                   iTrava := Fqry.FieldByName('LAST_NUMBER').AsInteger;
                   Application.ProcessMessages;
             until (itrava = 1); // Até liberar o semaforo
             FazQuery(Fqry, FormatSql('SELECT '+Semaforo.Nome+'.NEXTVAL NEXT FROM DUAL'));
          except end;
          TimerSeq.Enabled := false;
     end;
end;

// Libera a utilização de um sequence
procedure TSeqOracle.Libera;
var iNext : integer;
begin

     if (Semaforo.Existe) then
     begin
          try
             if not Sistema.UsuarioUnico then
             begin
                if FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+Semaforo.Nome+'''')) then
                begin
                     repeat
                           FazQuery(Fqry, FormatSql('SELECT '+Semaforo.Nome+'.NEXTVAL NEXT FROM DUAL'));
                           FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+Semaforo.Nome+''''));
                           iNext := Fqry.FieldByName('LAST_NUMBER').AsInteger;
                     until (iNext=1);
                end;
             end
             else
             begin
                if FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+Semaforo.Nome+'''')) then
                begin
                     repeat
                           FazQuery(Fqry, FormatSql('SELECT '+Semaforo.Nome+'.NEXTVAL NEXT FROM DUAL'));
                           FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+Semaforo.Nome+''''));
                           iNext := Fqry.FieldByName('LAST_NUMBER').AsInteger;
                     until (iNext=1);
                end;
             end;
          except end;
     end;
end;

function TSeqOracle.GetProximo : integer;
begin
     Result := -1;
     If Not FExiste And (GetAtual < GetIniFaixaSequence) Then
        Result := -9
     Else
       if (Semaforo.Existe) and (GetAtual >= GetMaximo) then
          Result := -8
       else
       Begin
          Try
            if Not Sistema.UsuarioUnico then
            begin
               if FazQuery(Fqry, FormatSql('SELECT CM.'+FNome+'.NEXTVAL NEXT FROM DUAL')) then
                   Result := Fqry.FieldByName('NEXT').AsInteger;
            end
            else
            begin
               if FazQuery(Fqry, FormatSql('SELECT '+Sistema.Owner+'.'+FNome+'.NEXTVAL NEXT FROM DUAL')) then
                   Result := Fqry.FieldByName('NEXT').AsInteger;
            end;
          Except
            {- Otimização dos Sequences}
            if Sistema.UsuarioUnico then Result := -7 // Usuário não pode criar nada no banco
            else
            begin
               CriaNoBanco(1);
               Result := GetProximo;
            end;
          End;
       End;
end;

function TSeqOracle.GetAtual : integer;
begin
     if not Sistema.UsuarioUnico then
     begin
        if FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+FNome+'''')) then
           Result := (Fqry.FieldByName('LAST_NUMBER').AsInteger-1)
        else
            Result := -1;
     end
     else
     begin
        if FazQuery(Fqry, FormatSql('SELECT LAST_NUMBER FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+FNome+'''')) then
           Result := (Fqry.FieldByName('LAST_NUMBER').AsInteger-1)
        else
            Result := -1;
     end;
end;

function TSeqOracle.GetMaximo : real;
begin
    if not Sistema.UsuarioUnico then
    begin
       if FazQuery(Fqry, FormatSql('SELECT MAX_VALUE FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ''CM'' AND SEQUENCE_NAME = '''+FNome+'''')) then
          Result := (Fqry.FieldByName('MAX_VALUE').AsFloat)
       else
           Result := 0;
    end
    else
    begin
       if FazQuery(Fqry, FormatSql('SELECT MAX_VALUE FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = ' + QuotedStr(Sistema.Owner) + ' AND SEQUENCE_NAME = '''+FNome+'''')) then
          Result := (Fqry.FieldByName('MAX_VALUE').AsFloat)
       else
           Result := 0;
    end;
end;

function TSeqOracle.GetIniFaixaSequence: real;
begin
    If FazQuery(Fqry, FormatSql('SELECT VLRINISEQ FROM FAIXASEQUENCE WHERE NOMESEQ = '''+FNome+'''')) Then
       Result := (Fqry.FieldByName('VLRINISEQ').AsFloat)
    Else
       Result := -1;
end;

function TSeqOracle.Altera( iMin, iMax, iIni : integer) : Boolean;
begin
     // Atualiza o sequence
     if not Sistema.UsuarioUnico then
     begin
        ExecutarQuery(Fqry, FormatSql('DROP SEQUENCE CM.'+FNome));
        try
           if iMax < 0 then
              ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE'+
                                  ' START WITH '+IntToStr(iIni)+' MINVALUE '+ IntToStr(iMin)+
                                  ' NOMAXVALUE '))
           else
               ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE CM.'+FNome+' INCREMENT BY 1 NOCACHE'+
                                   ' START WITH '+IntToStr(iIni)+' MINVALUE '+ IntToStr(iMin)+
                                   ' MAXVALUE '+IntToStr(iMax)));
           Result := true;
        except
              Result := false;
        end;
     end
     else
     begin
        ExecutarQuery(Fqry, FormatSql('DROP SEQUENCE '+Sistema.Owner+'.'+FNome));
        try
           if iMax < 0 then
              ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE '+Sistema.Owner+'.'+FNome+' INCREMENT BY 1 NOCACHE'+
                                  ' START WITH '+IntToStr(iIni)+' MINVALUE '+ IntToStr(iMin)+
                                  ' NOMAXVALUE '))
           else
               ExecutarQuery(Fqry, FormatSql('CREATE SEQUENCE '+Sistema.Owner+'.'+FNome+' INCREMENT BY 1 NOCACHE'+
                                   ' START WITH '+IntToStr(iIni)+' MINVALUE '+ IntToStr(iMin)+
                                   ' MAXVALUE '+IntToStr(iMax)));
           Result := true;
        except
              Result := false;
        end;
     end;
end;
                                                                       
procedure TSeqOracle.TLibera(Sender:TObject);
begin
     Libera;
end;


constructor TQrySeq.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     DatabaseName := TSequence(AOwner)._DataBaseName;
     SessionName := TSequence(AOwner)._SessionName;


     RequestLive := True;

     If IsDb2_Padrao Then
        UpdateMode := upWhereChanged
     Else
        UpdateMode := upWhereKeyOnly;
end;


constructor TSequence.Cria(NomedoSequence, NomedoBanco : string; sSessionName: String = '');
begin
     inherited Create(Application);
     TimerSeq := TTimer.Create(Application);
     TimerSeq.Enabled := false;
     TimerSeq.Interval := 15000;
     TimerSeq.OnTimer := TLibera;

     _DataBaseName := NomedoBanco;
     _SessionName := sSessionName;
     FNome := NomedoSequence;
     CriaNoBanco(0);
end;

destructor TSequence.Destroy;
begin
     Libera;
     TimerSeq.free;
     inherited Destroy;
end;

procedure TSequence.CriaNoBanco(ValorInicial : integer);
var FQry : TQrySeq ;
begin                                                             
     Fqry := TQrySeq.Create(self);
     Fqry.DatabaseName := _DataBaseName;
     Fqry.SessionName := _SessionName;

     try
        if not FazQuery(Fqry, FormatSql('SELECT Nome, Incremento, Circular, VlrAtual, Semaforo, Minimo, Maximo, TemMaximo FROM SEQUENCE WHERE Nome = '''+FNome+'''')) then
        begin
             FQry.Insert;
             FQry.FieldByName('NOME').AsString       := FNome;
             FQry.FieldByName('INCREMENTO').AsInteger := 1;
             FQry.FieldByName('CIRCULAR').AsInteger   := 0;
             FQry.FieldByName('VLRATUAL').AsFloat   := ValorInicial;
             FQry.FieldByName('SEMAFORO').AsInteger   := 0;
             Fqry.Post;
        end;

        Fqry.Edit;
        if FazQuery( dtmBaseDados.qry, FormatSql('SELECT NOMESEQ FROM FAIXASEQUENCE '+
                                       'WHERE NOMESEQ = '''+ Trim(Copy(FNome, 4, 50)) +'''')) then
        begin
             FQry.FieldByName('MINIMO').AsFloat := ValorInicial;
             FQry.FieldByName('MAXIMO').AsFloat := ValorInicial;
             FQry.FieldByName('TEMMAXIMO').AsInteger := 1;
        end
        else
        begin
             FQry.FieldByName('MINIMO').AsFloat := 1;
             FQry.FieldByName('MAXIMO').AsFloat := 0;
             FQry.FieldByName('TEMMAXIMO').AsInteger   := 0;
        end;
        Fqry.Post;
     finally
            Fqry.Free;
     end;
end;

// Trava a utilização de um sequence para uma única instancia
procedure TSequence.Trava;
var iSemaforo : integer;
    Travou : boolean;
    FQry : TQrySeq ;
begin
     Fqry := TQrySeq.Create(self);


     Randomize;
     TimerSeq.Enabled := true;
     iSemaforo := Random(1000000)+1;
     Travou := false;
     While not Travou do
     begin
          // Aguarda até que o campo Semaforo esteja vazio
          repeat

                FazQuery(Fqry, FormatSql('SELECT Semaforo FROM SEQUENCE WHERE (Nome = '''+FNome+''')'));
          until (Fqry.FieldByName('SEMAFORO').AsInteger = 0);
          repeat
                try
                   Fqry.Edit;
                   Fqry.FieldByName('SEMAFORO').Value := iSemaforo;
                   Fqry.Post;
                   Travou := true;
                except
                end;
          until Travou;
     end;
     TimerSeq.Enabled := false;
     Fqry.free;
end;

// Libera a utilização de um sequence
procedure TSequence.Libera;
var Fim : boolean;
    FQry : TQrySeq ;
begin
     Fqry := TQrySeq.Create(self);
     if FazQuery(Fqry, FormatSql('SELECT Semaforo FROM SEQUENCE WHERE Nome = '''+FNome+'''')) then
     begin
          Fim := false;
          repeat
                try
                   Fqry.Edit;
                   Fqry.FieldByName('SEMAFORO').Value := 0;
                   Fqry.Post;
                   Fim := true
                except
                end;
          until Fim;
     end;
     Fqry.free;
end;

function TSequence.GetProximo : integer;
var FQry : TQrySeq ;
    lOk : boolean;
begin
     Fqry := TQrySeq.Create(self);
     Trava;
     Result := -1;
     with Fqry do
     begin
          lOk := false;
          while not lOk do
          begin
               FazQuery(Fqry, FormatSql('SELECT VlrAtual, Incremento FROM SEQUENCE WHERE Nome = '''+FNome+''''));
               try
                  Result := MudaAtual(FieldByName('VLRATUAL').AsInteger + FieldByName('INCREMENTO').AsInteger);
                  if (Result <> -6) then
                     lOk := true;
               except

               end;
          end;
     end;
     Fqry.free;
     Libera;
end;

function TSequence.GetAtual : integer;
begin
     Result := GetInteger('VLRATUAL');
end;

function TSequence.GetMaximo : integer;
begin
     Result := GetInteger('MAXIMO');
end;

function TSequence.GetMinimo : integer;
begin
     Result := GetInteger('MINIMO');
end;

function TSequence.GetIncremento : integer;
begin
     Result := GetInteger('INCREMENTO');
end;

function TSequence.GetTemMaximo : boolean;
begin
     Result := (GetInteger('TEMMAXIMO') = 1);
end;

function TSequence.GetCircular : boolean;
begin
     Result := (GetInteger('CIRCULAR') = 1);
end;

procedure TSequence.SetMaximo( v : integer);
begin
     SetInteger(v, 'MAXIMO');
end;

procedure TSequence.SetMinimo( v : integer);
begin
     SetInteger(v, 'MINIMO');
end;

procedure TSequence.SetIncremento( v : integer);
begin
     SetInteger(v, 'INCREMENTO');
end;

procedure TSequence.SetAtual( v : integer);
begin
     MudaAtual(v);
end;

function TSequence.MudaAtual( v : integer) : integer;
var FQry : TqrySeq;
begin
     FQry := TQrySeq.Create(self);

     with FQry do
     begin
          FazQuery(Fqry, FormatSql('SELECT Minimo, Maximo, TemMaximo, Circular, VlrAtual FROM SEQUENCE WHERE Nome = '''+FNome+''''));
          if (FieldByName('TEMMAXIMO').AsInteger = 1) then
          if (v > FieldByName('MAXIMO').AsInteger) then
             if (FieldByName('CIRCULAR').AsInteger = 1) then
                v := FieldByName('MINIMO').AsInteger
             else
                 v := -8; // ValorAtual > Maximo

          if ( v < FieldByName('MINIMO').AsInteger) then
             if (FieldByName('CIRCULAR').AsInteger = 1) then
                v := FieldByName('MAXIMO').AsInteger
             else
                 v := -7; // ValorAtual < Minimo

          if v >= 0 then
          begin
               try
                  FQry.Edit;
                  FQry.FieldByName('VLRATUAL').Value := v;
                  FQry.Post;
               except
                     v := -6; // Valor atual não pode ser alterado;
               end;;
          end;
          Result := v;
          free;
     end;
end;

procedure TSequence.SetTemMaximo( v : boolean);
begin
     if v then
        SetInteger( 1, 'TEMMAXIMO')
     else
        SetInteger( 0, 'TEMMAXIMO')

end;

procedure TSequence.SetCircular( v : boolean);
begin
     if v then
        SetInteger( 1, 'CIRCULAR')
     else
        SetInteger( 0, 'CIRCULAR')
end;

procedure TSequence.TLibera(Sender:TObject);
begin                                                         
     Libera;
end;

procedure TSequence.SetInteger( v : integer; coluna : string);
var FQry : TQrySeq ;
begin
     Trava;
     Fqry := TQrySeq.Create(self);
     FQry.Edit;
     FQry.FieldByName(coluna).Value := v;
     FQry.Post;
     Fqry.Free;
     Libera;
end;

function TSequence.GetInteger( coluna : string) : integer;
var FQry : TQrySeq ;
begin
     Trava;
     Fqry := TQrySeq.Create(self);
     if FazQuery(Fqry, FormatSql('SELECT '+ coluna + ' FROM SEQUENCE WHERE Nome = '''+FNome+'''')) then
        Result := (Fqry.FieldByName(coluna).AsInteger)
     else
         Result := 0;
     Fqry.free;
     Libera;
end;

function TSeqOracle.GetFaixaSeqCentraliza(var rValorIni, rValorFin: LongInt):Boolean;
begin

    Result := FazQuery(Fqry, FormatSql('SELECT VLRINISEQ, VLRFINSEQ FROM FAIXASEQUENCE WHERE NOMESEQ = ''CM_SEQCENTRALIZA'''));

    If Result Then
    Begin
       rValorIni := Fqry.Fields[0].AsInteger;
       rValorFin := Fqry.Fields[1].AsInteger;
    End;
end;

initialization

finalization
   
end.


