unit UCalculosRetroativos;

interface

uses SysUtils;


implementation

uses UAdmPREV, DAPrev;

// Buscar Patrocinadora, Plano e FlgInterno da Situacao na Fundacao que o
// participante estava em um determinado mês
function BuscaDadosNoMes  ( piIdPessoa,
                            piSeqProposta           : longint;
                            psAnoMes                : string;
                            var piPatroNaEpoca,
                                piPlanoNaEpoca      : longint  ) : string;
begin
    Result := 'AT';

    with dtmAPrev.qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO '+
               ' FROM   SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    TO_CHAR(EV.DATAEVENTO,''YYYY/MM'') <= '''+psAnoMes+''''+
               ' AND    ((EV.DATAVOLTA IS NULL) OR (EV.DATAVOLTA >= '''+psAnoMes+''')) '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          Result             := FieldByName('FlgInterno').AsString;
          piPatroNaEpoca     := FieldByName('IdPessJur').AsInteger;
          piPlanoNaEpoca     := FieldByName('IdPlanoPrev').AsInteger;
       end;
       Close;
    end;
end; // BuscaDadosNoMes

end.
